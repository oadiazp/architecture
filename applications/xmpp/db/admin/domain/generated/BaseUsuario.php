<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
abstract class BaseUsuario extends Doctrine_Record 
 { 
   public function setTableDefinition() 
    { 
       $this->setTableName('usuario'); 
       $this->hasColumn('idusuario', 'numeric', null, array('notnull' => true, 'primary' => true, 'sequence' => 'mod_admin.seq_usuario_seq')); 
       $this->hasColumn('passwd', 'character varying', 255 , array('notnull' => false, 'primary' => false)); 
       $this->hasColumn('correo', 'character varying', 255 , array('notnull' => false, 'primary' => false)); 
       $this->hasColumn('usuario', 'character varying', 255 , array('notnull' => false, 'primary' => false)); 
    } 
 
   public function Setup() 
    { 
       parent::setUp(); 
    } 
 }//fin clase

