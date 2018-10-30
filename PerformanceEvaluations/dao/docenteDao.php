<?php

class DocenteDao {
    private $model = null;
    public function __construct(){
        $this->model = new model();
    }

    public function insertar($dto){
        $query = "INSERT INTO docente (codigo, id_persona, id_tipo_docente, id_departamento) VALUES ('".$dto->getCodigo()."', '".$dto->getIdPersona()."', '".$dto->getIdDocente()."', '".$dto->getIdDepartamento()."')";
        $this->model->conexion();
        $respuesta = $this->model->query($query);
        $this->model->closeConexion();
        if($respuesta){
            return 0;
        }
        return 1;
    }


    public function actualizar($usuario, $password, $newPassword){
        $query = "UPDATE usuario SET contraseña = '".$newPassword."' WHERE usuario = '".$usuario."' AND contraseña = '".$password."'";
        $this->model->conexion();
        $respuesta = $this->model->query($query);
        $this->model->closeConexion();
        if($respuesta){
            return 0;
        }
        return 1;
    }

    public function eliminar($usuario){
        $query = "DELETE FROM usuario WHERE usuario = '".$usuario."'";
        $this->model->conexion();
        $respuesta = $this->model->query($query);
        $this->model->closeConexion();
        if($respuesta){
            return 0;
        }
        return 1;
    }

    public function listar(){
        $query = "SELECT persona.nombres, persona.apellidos, docente.codigo, docente.id_departamento FROM persona INNER JOIN docente ON persona.dni = docente.id_persona ORDER BY persona.nombres";
        $this->model->conexion();
        $respuesta = $this->model->query($query);
        $this->model->closeConexion();
        $array = array();

        if(isset($respuesta) && $respuesta->num_rows>0){
            while($row = mysqli_fetch_array($respuesta)){
                array_unshift($array, $row);
            }
        }
        return ($array);
    }

    public function listarTipo($tipo){
        $query = "SELECT * FROM usuario ORDER BY usuario ASC WHERE tipo = $tipo" ;
        $this->model->conexion();
        $respuesta = $this->model->query($query);
        $this->model->closeConexion();
        $array = array();

        if(isset($respuesta) && $respuesta->num_rows>0){
            while($row = mysqli_fetch_array($respuesta)){
                array_unshift($array, $row);
            }
        }
        return ($array);
    }

    public function buscar($usuario){
        $query = "SELECT * FROM usuario WHERE usuario = '".$usuario."'";
        $this->model->conexion();
        $respuesta = $this->model->query($query);
        $this->model->closeConexion();
        $json_data = array();

        if(isset($respuesta) && $respuesta->num_rows>0){
            $json_data['success'] = 0;

            $row = mysqli_fetch_array($respuesta);
            $user = array();
            $user['usuario'] = $row['usuario'];
            $user['contraseña'] = $row['password'];
            $user['tipo'] = $row['tipo'];
            $json_data['usuario'] = $user;
        }else{
            $json_data['success'] = 1;
        }

        return $json_data;
    }
}
?>