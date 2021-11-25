/client/New()
	. = ..()
	if(ckey in SSage_check.underage_ckeys)
		to_chat(src, "Yeah no, you're not getting in for this round.")
		qdel(src)
		return

	if(SSage_check.initialized)
		prompt_age_check()

/client/proc/prompt_age_check()
	var/static/agecheck_criticalfailure = "no UwU, i'm a tiny cub to be lewded~ btw i have a 39 inch cock" // Used twice in the code below
	var/static/list/funne_reddit = list("Underage Detector 9000 \[TM\]", "Better on the rebase", "This will go on reddit",\
	"Why are we still here", "Lance will mald", "ERP interactions were a mistake", "Actual lawyer bird look", "Todo: add more meme titles",\
	"This was gonna be good but i'm lazy", "Screee", "Courtesy of Null", "It's a shitpost, how could you tell?",\
	"Big hard throbbing cocks", "It's kinda funny how this actually needs to be a thing", "The message was funnier, but people can't take jokes", )
	if(ckey in SSage_check.passed_ua_check)
		return

	var/funnies = alert(src, "Are you over the age of 18? (This message was much funnier but funny legals.)\n", pick(funne_reddit),\
	"No", "Yes", agecheck_criticalfailure)
	if(funnies != "Yes")
		SSage_check.underage_ckeys += ckey
		if(agecheck_criticalfailure)
			to_chat(src, "<span class='narsie'>Bruh.</span>")
			sleep(10)
			message_admins("Funny user \'[key_name(src)]\' said \"[funnies]\" to the 18+ prompt, we're just gonna boot them for this round. It's on your ass now what you choose to do with them. - Null")
		qdel(src)
		return
	SSage_check.passed_ua_check += ckey
