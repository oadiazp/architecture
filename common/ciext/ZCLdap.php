<?php
class ZCLdap
{
	var $displayname;
	var $mail;
	var $mailnickname;
	var $title;	
	var $facultad;
	var $anno;
    var $solapin;
	
	function Login($domain,$user,$password)
	{
		$ds = ldap_connect('ldap://uci.cu');
		$r=@ldap_bind($ds,$user.'@uci.cu',$password);
		if($r!=1)
			{
				return false;
			}			
		if($ds)
		{
			 $sr=ldap_search($ds,"OU=UCI Domain Users,DC=uci,DC=cu", "mail=$user@*"); 




             if(ldap_count_entries($ds,$sr)<1)
			 		return false;					

			return true;
			
		}
		else
		{
			return false;
		}
		
	}
	function search_user($domain,$user,$password,$usrer_2)
	{
		
		$ds = ldap_connect($domain);
		$r=@ldap_bind($ds,$user.'@uci.cu',$password);
		if($r!=1)
			return false;
		if($ds)
		{
			 $sr=ldap_search($ds,"OU=UCI Domain Users,DC=uci,DC=cu", "mail=$usrer_2@*"); 
			 if(ldap_count_entries($ds,$sr)<1)
			 		return false;			
             
			 $info = ldap_get_entries($ds, $sr);
             
             
			 $this->displayname = $info[0]['displayname'][0];
             $this->solapin = (isset ($info[0]['postofficebox'][0])) ? $info[0]['postofficebox'][0] : '';
			 $this->mail = $info[0]['mail'][0];
			 $this->mailnickname = (isset ($info[0]['mailnickname'][0])) ? $info[0]['mailnickname'][0] : '';
			 $this->title = $info[0]['title'][0];
			
			return true;
			
		}
		else
		{
			return false;
		}		
	}
	
	
}


/*
//test class 
$uci_domain=new uci_ldap();
if($uci_domain->Login('ucidc2.uci.cu','tu usuario','tu passwod'))
{
	
	echo('nombre: '.$uci_domain->displayname.'<br></br>');
	echo('mail: '.$uci_domain->mail.'<br></br>');
	echo('login: '.$uci_domain->mailnickname.'<br></br>');
	echo('nombre: '.$uci_domain->title.'<br></br>');
	
}
/**/


?>
