<?php
    function info_msg ($pMessage) {
        $data->mensaje = $pMessage;
        $data->codMsg = 1;
       
        echo json_encode($data);
    }

    function error_msg ($pMessage) {
        $data->mensaje = $pMessage;
        $data->codMsg = 3;

        echo json_encode($data);
    }

    function ext_msg ($pMessage, $pCaption) {
        $ci = &get_instance();
        $url = $ci->config->item ('base_url');


        echo "<html>
	<head>
		<link href='{$url}js/ext/resources/css/ext-all.css' type='text/css' rel='stylesheet'>
        <link href='{$url}css/css.css' type='text/css' rel='stylesheet'/>
	</head>
	<body>
		<script type='text/javascript' src = '{$url}js/ext/ext-base.js'></script>
		<script type='text/javascript' src = '{$url}js/ext/ext-all.js'></script>
		<script type='text/javascript' src = '{$url}js/utils.js'></script>
		<script type='text/javascript' src = '{$url}js/blank.js'></script>

        <script>
                Ext.Msg.show({
                   icon: 'icono_error',
                   title:'$pCaption',
                   msg: '$pMessage',
                   fn: function () {window.location = '$url'},
                   buttons: Ext.Msg.OK,
                   animEl: 'elId'
                });
        </script>
	 </body>
     </html>";
    }
?>
