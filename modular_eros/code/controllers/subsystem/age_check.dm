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
		
	var/datum/DBQuery/query_get_age_checkeds = SSdbcore.NewQuery("SELECT age_vers FROM [format_table_name("age_verified")]")
	if(query_get_age_checkeds.Execute())
		while(query_get_age_checkeds.NextRow())
			passed_ua_check += query_get_age_checkeds.item[1]
	qdel(query_get_age_checkeds)
	return ..()

/datum/controller/subsystem/age_check/proc/prompt_global_age_check()
	for(var/client/C in GLOB.clients)
		INVOKE_ASYNC(C, /client.proc/prompt_age_check)
