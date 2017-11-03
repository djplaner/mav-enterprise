{* Smarty *}

{*********************************************************
  @ description: MAV SQL Query Template for getActivity.php
  @ project: MAV
  @ komodotemplate: 
  @ author: Damien Clark <damo.clarky@gmail.com>
  @ date: 30th May 2014

  - will need to think how to handle the case when there is no selected group
    and it should be all.  Does smarty do if statements?
**********************************************************}
--Get list of student usernames who have accessed a particular resource
select 
   distinct u.username,u.firstname,u.lastname,u.email
from 
   {$table.summary} ls, {$dbprefix}user u

   {if $selectedGroups} 
   ,{$dbprefix}groups g, {$dbprefix}groups_members gm
   {/if}

where
  ls.userid = u.id
  and ls.url = :url
  and ls.courseid = :courseid
  {if $selectedGroups}
    and ls.userid = gm.userid
    and gm.groupid in ({$selectedGroups|@implode:', '}) 
    and gm.groupid = g.id and g.courseid = ls.courseid
  {/if}
  order by u.lastname,u.firstname
;
