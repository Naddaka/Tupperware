
		<form class="row" action="{site_url('feedback')}" method="post">
			{if $message_sent == 1}
				<div class="been-sent"> 
                <div class="sent-info">{echo siteinfo('siteinfo_transl-sent')}</div>
                <a href="{site_url()}"><button type="button" class="btn btn-primary btn-sm">{echo siteinfo('siteinfo_transl-tomain')}</button></a>
                </div>
			{/if}
			{if validation_errors()}
			
				<em>{validation_errors('<p>', '</p>')}</em>
			
			{/if}
			<div class="col-sm-6 col-md-6">
                                    <div class="form-group">
				
				
					<input class="form-control" id="exampleInputEmail1" placeholder="{echo siteinfo('siteinfo_transl-name')} *" type="text" name="name" value="{set_value('name')}" required>
				</div>
			<div class="form-group">
			
				
					<input class="form-control" id="exampleInputPassword1" placeholder="{echo siteinfo('siteinfo_transl-email')} *" type="email" name="email" value="{set_value('email')}" required>
				</div>
			<!--<div class="form-group">
					<input class="form-control" id="exampleInputEmail1" placeholder="{tlang('Subject')} *" type="text" name="theme" value="{set_value('theme')}" required>
				</div> -->
                
            
             <p class="formtel help-block alignleft hidden-xs">{echo siteinfo('siteinfo_mainphone')}</p>
             </div>
             
             <div class="col-sm-6 col-md-6">
			    <div class="form-group">
 			
					<textarea class="form-control" placeholder="{echo siteinfo('siteinfo_transl-message')} *" name="message" required>{set_value('message')}</textarea>
 			
 			<!--{if $captcha_type =='captcha'}
 			{tlang('Security code')}
 						<input type="text" name="captcha" required>
 						{tlang('Type the characters you see in this image.')}
 						{$cap_image}
 					{if form_error('captcha')}
 					{form_error('captcha')}
 					{/if}
 				
			{/if} -->
			</div>
            <div class="form-group ">
				<input type="submit" value="{echo siteinfo('siteinfo_transl-send')}" class="btn btn-primary pull-left"></div>
                
			</div>
			{form_csrf()}
		</form>