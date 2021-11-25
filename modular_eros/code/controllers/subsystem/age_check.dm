SUBSYSTEM_DEF(age_check)
	name = "Age Check"
	flags = SS_NO_FIRE
	init_order = INIT_ORDER_AGE_CHECK
	var/list/underage_ckeys = list()
	var/list/passed_ua_check = list()

/datum/controller/subsystem/age_check/Initialize(start_timeofday)
	prompt_global_age_check()
	return ..()

/datum/controller/subsystem/age_check/Initialize(start_timeofday)
	if(!SSdbcore.Connect())
		message_admins("Age Check Subsystem - Failed to establish database connection. Everyone will have to go through the prompt now.")
		return ..()

	var/datum/DBQuery/query_get_age_checkeds = SSdbcore.NewQuery("SELECT ckey FROM [format_table_name("age_verified")]")
	if(query_get_age_checkeds.Execute())
		while(query_get_age_checkeds.NextRow())
			passed_ua_check += query_get_age_checkeds.item[1]
	qdel(query_get_age_checkeds)
	return ..()

/datum/controller/subsystem/age_check/Shutdown()
	if(!SSdbcore.Connect())
		return ..()
	
	var/datum/DBQuery/query_get_age_checkeds = SSdbcore.NewQuery("SELECT ckey FROM [format_table_name("age_verified")]")
	if(!query_get_age_checkeds.Execute())
		return ..()

	var/list/listed_ckeys = list()	
	while(query_get_age_checkeds.NextRow())
		listed_ckeys += query_get_age_checkeds.item[1]
	
	var/query = "INSERT INTO [format_table_name("age_verified")] (ckey) VALUES "
	for(var/ckey in listed_ckeys)
		query += "('[sanitizeSQL(ckey)]'), "
	
	query = copytext_char(query, 1, length(query) - 2)
	var/datum/DBQuery/query_insert_ckeys = SSdbcore.NewQuery(query)
	query_insert_ckeys.Execute()
	return ..()
	
/datum/controller/subsystem/age_check/proc/prompt_global_age_check()
	for(var/client/C in GLOB.clients)
		INVOKE_ASYNC(C, /client.proc/prompt_age_check)
