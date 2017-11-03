{* Smarty *}

{**********************************************************
  @ description: MAV SQL Query Template for getActivity.php
  @ project: MAV
  @ komodotemplate: 
  @ author: Damien Clark <damo.clarky@gmail.com>
  @ date: 30th May 2014
**********************************************************}
--Get list of student usernames who have NOT accessed a particular resource
select 
   u.username,u.firstname,u.lastname,u.email
from 
  {$dbprefix}role r, {$dbprefix}role_assignments ra, {$dbprefix}context con, 
  {$dbprefix}course c, {$dbprefix}user u

    {if $selectedGroups}
    ,{$dbprefix}groups g, {$dbprefix}groups_members gm
    {/if} 

where
  con.contextlevel = 50
  and con.id = ra.contextid
  and r.id = ra.roleid
  and ra.userid = u.id
  and r.archetype = 'student'
  and con.instanceid = c.id
  and c.id = :courseid
 {if $selectedGroups}
     and ra.userid = gm.userid
     and gm.groupid in ({$selectedGroups|@implode:', '})
     and gm.groupid = g.id 
     and g.courseid = :courseid
   {/if} 
except
--Get list of student usernames who have accessed a particular resource
select distinct u.username,u.firstname,u.lastname,u.email from {$table.summary} ls, {$dbprefix}user u, {$dbprefix}course c
where
  ls.userid = u.id
  and ls.courseid = c.id
  and ls.url = :url
	and ls.courseid = :courseid
order by lastname,firstname
;
