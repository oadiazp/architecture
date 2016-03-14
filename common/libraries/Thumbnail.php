<?php
    class Thumbnail {
        function  __construct() {
            $config['image_library'] = 'gd2';
            $config['create_thumb'] = TRUE;
            $config['maintain_ratio'] = TRUE;
            $config['width'] = 80;
            $config['height'] = 60;

            $this->_ci = &get_instance();
            $this->_ci->load->library('image_lib', $config);
        }


        function create ($pSourceImg, $pDestinationImg)  {
            $config['source_image'] = $pSourceImg;
            $config['new_image'] = $pDestinationImg;
            $this->_ci->image_lib->initialize ($config);
            $this->_ci->image_lib->resize();
        }
    }
?>
