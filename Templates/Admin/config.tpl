<?php 
.del {width:12px; height:12px; background-image: url(img/admin/icon/del.gif);} 
</style>  
<table id="member">
  <thead>
    <tr>
        <th>~ Server Settings ~</th>
    </tr>
  </thead> 

</table>
<table id="profile">    
    <tr>
        <td class="b">Variable</td>
        <td class="b">Value</td> 
    </tr> 
    <tr>
        <td>Server Name</td>
        <td><?php echo SERVER_NAME;?></td>    
    </tr> 
    <tr>
        <td>Language</td>
        <td><?php if(LANG == en){
    </tr>  
    <tr>  
        <td>Server Speed</td>
        <td><?php echo SPEED;?></td>    
    </tr>  
    <tr>
        <td>Map Size</td>
        <td><?php echo WORLD_MAX;?>x<?php echo WORLD_MAX;?></td>    
    </tr>  
	<tr>
        <td>Troop Speed</td>
        <td><?php echo INCREASE_SPEED;?>x</td>    
    </tr> 
	</table>
	
<table id="member">
  <thead>
    <tr>
        <th>~ Log Settings ~</th>
    </tr>
  </thead>
</table>  
  
  <table id="profile">  
  <tr>
        <td class="b">Variable</td>
        <td class="b">Value</td> 
    </tr> 
    <tr>
        <td>Log Build</td>
        <td><?php if(LOG_BUILD == true) {
    </tr>    
    <tr>
        <td>Log Technology</td>
        <td><?php if(LOG_TECH == true) {
    </tr>    
    <tr>
        <td>Log Login</td>
        <td><?php if(LOG_LOGIN == true) {
    </tr>    
    <tr>
        <td>Log Gold</td>
        <td><?php if(LOG_GOLD_FIN == true) {
    </tr>    
    <tr>
        <td>Log Admin</td>
        <td><?php if(LOG_ADMIN == true) {
    </tr>     
    <tr>
        <td>Log War</td>
        <td><?php if(LOG_WAR == true) {
    </tr>     
    <tr>
        <td>Log Market</td>
        <td><?php if(LOG_MARKET == true) {
    </tr>     
    <tr>
        <td>Log Illegal</td>
        <td><?php if(LOG_ILLEGAL == true) {
    </tr>     
       	</table>
	
<table id="member">
  <thead>
    <tr>
        <th>~ Newsbox Settings ~</th>
    </tr>
  </thead>
</table>  
  
  <table id="profile">  
  <tr>
        <td class="b">Variable</td>
        <td class="b">Value</td> 
    </tr> 
  </table>
	
<table id="member">
  <thead>
    <tr>
        <th>~ SQL Settings ~</th>
    </tr>
  </thead>
<table id="profile">  
  <tr>
        <td class="b">Variable</td>
        <td class="b">Value</td> 
    </tr> 
    <tr>
        <td>Hostname</td>
        <td><?php echo SQL_SERVER;?></td> 
    </tr>    
	<tr>
        <td>DB Username</td>
        <td><?php echo SQL_USER;?></td> 
    </tr>  
	<tr>
        <td>DB Password</td>
        <td>*********</td> 
    </tr>  
	<tr>
        <td>DB Name</td>
        <td><?php echo SQL_DB;?></td> 
    </tr>  
	<tr>
        <td>Table Prefix</td>
        <td><?php echo TB_PREFIX;?></td> 
    </tr> 
	<tr>
        <td>DB Type</td>
        <td><?php 
    </tr> 
	</table>
	
<?php

function define_array( $array, $keys = NULL )
{
    foreach( $array as $key => $value )
    {
        $keyname = ($keys ? $keys . "_" : "") . $key;
        if( is_array( $array[$key] ) )
            define_array( $array[$key], $keyname );
        else
            define( $keyname, $value );
    }
}

//define_array($array);

?>