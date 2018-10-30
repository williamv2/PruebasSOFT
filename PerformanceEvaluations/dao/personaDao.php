<?php
class PersonaDao{
    private $model = null;
    public function __construct(){
        $this->model = new model();
    }

    public function insertar($dto){
        $query = "INSERT INTO persona (dni, nombres, apellidos, celular, direccion, correo) VALUES ('".$dto->getDni()."', '".$dto->getNombres()."', '".$dto->getApellidos()."', '".$dto->getCelular()."', '".$dto->getDireccion()."', '".$dto->getCorreo()."')";
        $this->model->conexion();
        $respuesta = $this->model->query($query);
        $this->model->closeConexion();
        if($respuesta){
            return 0;
        }
        return 1;
    }

    public function actualizar($dni, $celular, $direccion){
        $query = "UPDATE persona SET celular = '".$celular."', direccion = '".$direccion."' WHERE dni = (SELECT dni FROM (SELECT persona.dni FROM persona, docente WHERE docente.codigo = '".$dni."' AND persona.dni = docente.id_persona) AS alias_persona)";
        $this->model->conexion();
        $respuesta = $this->model->query($query);
        $this->model->closeConexion();
        if($respuesta){
            return 0;
        }
        return 1;
    }

    public function listar(){
        $query = "SELECT * FROM persona ORDER BY nombres ASC";
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
        $query = "SELECT persona.dni, persona.nombres, persona.apellidos, persona.celular, persona.direccion, persona.correo, docente.codigo FROM persona INNER JOIN docente ON docente.codigo = '".$usuario."' AND docente.id_persona = persona.dni";
        $this->model->conexion();
        $respuesta = $this->model->query($query);
        $this->model->closeConexion();
        $json_data = array();

        if(isset($respuesta) && $respuesta->num_rows>0){
            $json_data['success'] = 0;

            $row = mysqli_fetch_array($respuesta);
            $persona = array();
            $persona['dni'] = $row['dni'];
            $persona['nombres'] = $row['nombres'];
            $persona['apellidos'] = $row['apellidos'];
            $persona['celular'] = $row['celular'];
            $persona['direccion'] = $row['direccion'];
            $persona['correo'] = $row['correo'];
            $persona['codigo'] = $row['codigo'];

            $json_data['persona'] = $persona;
        }else{
            $json_data['success'] = 1;
        }
        return $json_data;
    }

    public function existencia($dni){
        $query = "SELECT * FROM persona WHERE dni = '".$dni."'";
        $this->model->conexion();
        $respuesta = $this->model->query($query);
        $this->model->closeConexion();
        if($respuesta){
            return 0;
        }
        return 1;
    }

    public function cambiarEstado($usuario, $newEstado){
        $query = "UPDATE usuario SET estado = '".$newEstado."' WHERE usuario = '".$usuario."'";
        $this->model->conexion();
        $respuesta = $this->model->query($query);
        $this->model->closeConexion();
        if($respuesta){
            return 0;
        }
        return 1;
    }
}
?>