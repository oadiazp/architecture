<?php
class Finder extends MY_Controller {
    /**
     * @var ZCProxy_Residencia
     */
    private $_service;
    
    function __construct() {
        parent::MY_Controller();
        $this->_service = new ZCProxy_Residencia ();
    }
    
    function index () {
        $this->render (array ('ns', 'winInstructor-ui', 'winInstructor', 'vpFinder-ui', 'vpFinder'));
    }
    
    function aptos () {
        $json->data = $this->_service->ObtenerApartamentos ();
        echo json_encode ($json);
    }
    
    function persons () {
        $identificacion = new ZCProxy_Identificacion_V5 ();
        
        $residentes = $this->_service->ObtenerResidentesDadoIdApartamento ($this->input->post ('apto'));
        $data = array ();
        
        foreach ($residentes as $residente) {
            $id = $identificacion->ObtenerFotoDadoIdExpediente($residente->IdExpediente);
            
            if (!file_exists("tmp/{$residente->IdExpediente}.jpg")) {            
                file_put_contents("tmp/{$residente->IdExpediente}.jpg", file_get_contents($id->valorFoto));
                $this->thumbnail->create ("tmp/{$residente->IdExpediente}.jpg", 
                                          "public/img/{$residente->IdExpediente}.jpg");
            }
            
            $thumb = base_url () . "public/img/{$residente->IdExpediente}_thumb.jpg";
            
            $data[] = array ('name'  => $residente->NombreCompleto,
                             'pic'   => $thumb,
                             'url'   => $id->valorFoto,
                             'phone' => $this->input->post ('telef'),
                             'id'    => $residente->IdExpediente,
                             'room'  => $residente->Cuarto->Numero);
        }
        
        $instructor = $this->_service->ObtenerInstructoresDadoIdEdificio ($this->input->post ('edificio'));
        
        debug ($instructor);
        
        //$this->session->instructor_name = 
        
        echo json_encode(array ('data' => $data));
    }
}
?>
