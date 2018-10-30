<?php
class UsuarioDto{

    private $usuario;
    private $clave;
    private $estado;

    public function __construct($usuario, $clave, $estado) {
        $this->usuario = $usuario;
        $this->clave = $clave;
        $this->estado = $estado;
    }

    public function getUsuario() {
        return $this->usuario;
    }

    public function setUsuario($usuario) {
        $this->usuario = $usuario;
    }

    public function getClave() {
        return $this->clave;
    }

    public function setClave($clave) {
        $this->clave = $clave;
    }

    public function getEstado(){
        return $this->estado;
    }

    public function setEstado($estado){
        $this->estado = $estado;
    }
}
?>