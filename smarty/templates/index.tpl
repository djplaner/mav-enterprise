{* Smarty *}
{extends file="layout.tpl"}


{block name=headerCSS append}
<style>
	
	p.screenshots img {
		padding: 5px;
		border: 1px solid #cccccc;
		margin: 15px 15px 15px 15px;	
	}
	div.ui-state-error { padding-left: 15px; }
	div.ui-state-error img { margin: 0px; }
	div.ui-state-error h2 { margin-top: 7px; padding-top: 0px; }
	
	
</style>	
{/block}

{block name=headerJS append}

    <script type="text/javascript">
	    
		
		jQuery(document).ready(function(){
			
		})
		
    </script>

{/block}

{block  name=bodyContent}

<h2 class="feature">Moodle Activity Viewer is a browser plugin for Firefox that allows you visualise student activity within your Moodle course site using heat maps.</h2>

{if $browser.browser == "Firefox"}

	{if $browser.majorver >= 15}

		<h3>Moodle Activity Viewer install instructions:</h3>
    
    	<ol class="spaced">
			<li>Please install the <a target="_blank" href="https://addons.mozilla.org/en-US/firefox/addon/greasemonkey/" title="Greasemonkey Firefox Plugin">Greasemonkey Firefox Plugin</a>.  Once you have installed Greasemonkey, you may need to restart your browser.</li>
			<li>Next, you need to install the <a href="gm/moodleActivityViewer.user.js" title="Moodle Activity Viewer Plugin">Moodle Activity Viewer Plugin</a>. </li>
			<li>Now all you need do is navigate to your <a href="http://moodle.server.com">Moodle</a> course site, and click the <i>Turn Activity View On</i> link (see below) in the Course Administration Block.</li>
			<li>When you wish to switch back to normal view (turn off Moodle Activity Viewer), click the <i>Turn Activity View Off</i> link in the Course Administration Block.</li>
		</ol>
        
		<p class="screenshots"><img src="images/screenshot.png" alt="MAV Screenshot" style="width:90%" /></p>
        
  {else}
        
		<div class="ui-state-error ui-corner-all">
            <p><img src="images/firefoxLogo.png" alt="Firefox" /></p>
            <h2>Sorry, your version of Firefox needs to be updated.</h2>
            <p>You are using an old version of Firefox (version {$browser.version}).  Please visit the <a href="http://support.mozilla.org/en-US/kb/update-firefox-latest-version" target="_blank">Firefox Update Instructions Page</a> to update to the latest version before installing Moodle Activity Viewer (MAV).</p>
        </div>
		
        
	{/if}
		
{else} {* Incompatible browser *}

    <div class="ui-state-error ui-corner-all">
    	<p><img src="images/firefoxLogo.png" alt="Firefox" /></p>
        <h2>Sorry, the Moodle Activity Viewer only works with Firefox</h2>
		<p>You are using {$browser.browser}.  To use Moodle Activity Viewer, you need to install Firefox. </p>
		<p>You can <a href="https://download.mozilla.org/" target="_blank">download and install Firefox</a> from Mozilla.</p>
    </div>
    
{/if}

{/block}
