<?php
/*El docente puede:
*/

class Docente{
    //Metodo de buscar usuario
    public function buscarUsuario($usuario){
        $dao = new PersonaDao();
        echo json_encode($dao->buscar($usuario),JSON_FORCE_OBJECT);
    }

    //Metodo de actualizar perfil de docente
    public function actualizarPerfil($usuario, $celular, $direccion){
        $dao = new PersonaDao();

        $respuesta = $dao->actualizar($usuario, $celular, $direccion);
        if ($respuesta == 0) {
            echo '<script> alert("Actualizacion Exitosa")</script>';
            header('Location: views/docente/editProfile.php');
        }else{
            echo '<script> alert("Actualizacion Fallida")</script>';
        }
    }

    public function evaluacionPar($codigo, $a, $b, $c, $d, $e, $f, $g, $h){
        $numItem = 8;
        $valorPorcentual = 100/$numItem;
        $valorItem =$valorPorcentual/10;
        $resultado = $a*$valorItem+$b*$valorItem+$c*$valorItem+$d*$valorItem+$e*$valorItem+$f*$valorItem+$g*$valorItem+$h*$valorItem;

        $daoP = new PeriodoDao();
        $buscar_periodo = $daoP->buscarActual();
        $id_periodo = $buscar_periodo['id'];

        $dtoE = new EvaluacionDto($id_periodo, $resultado, "Ninguna", 2);
        $daoE = new EvaluacionDao();

        $respuesta = $daoE->insertar($dtoE);
        if ($respuesta == 0) {
            $buscar_id_evaluation = $daoE->buscarUltimo();
            $id_evaluation = $buscar_id_evaluation['id'];

            echo '<script> alert("Creacion Exitosa")</script>';
            $evaluacionD = $this->crearEvaluacionDocente($codigo, $id_evaluation);
            if ($evaluacionD == 0) {
                header('Location: views/docente/listPairEvaluation.php');
                echo '<script> alert("Evaluacion Exitoso")</script>';
            } else {
                echo '<script> alert("Evaluacion Fallido")</script>';
            }
        }else {
            echo '<script> alert("Creacion Fallida")</script>';
        }

    }

    public function crearEvaluacionDocente($codigo_docente, $id_evaluacion){
        $dto = new EvaluacionDocenteDto($codigo_docente, $id_evaluacion);
        $dao = new EvaluacionDocenteDao();

        $respuesta = $dao->insertar($dto);
        if ($respuesta == 0) {
            echo '<script> alert("Creacion Exitosa")</script>';
        }else {
            echo '<script> alert("Creacion Fallida")</script>';
        }
    }

    public function autoEvaluacion($codigo, $a, $b, $c, $d, $e, $f, $g, $h, $i, $j, $k){
        $numItem = 11;
        $valorPorcentual = 100/$numItem;
        $valorItem =$valorPorcentual/10;
        $resultado = $a * $valorItem + $b * $valorItem + $c * $valorItem + $d * $valorItem + $e * $valorItem + $f * $valorItem + $g * $valorItem + $h * $valorItem + $i * $valorItem + $j * $valorItem + $k * $valorItem;

        $daoP = new PeriodoDao();
        $buscar_periodo = $daoP->buscarActual();
        $id_periodo = $buscar_periodo['id'];

        $dtoE = new EvaluacionDto($id_periodo, $resultado, "Ninguna", 3);
        $daoE = new EvaluacionDao();

        $respuesta2 = $daoE->insertar($dtoE);
        if ($respuesta2 == 0) {
            $buscar_id_evaluation = $daoE->buscarUltimo();
            $id_evaluation = $buscar_id_evaluation['id'];

            echo '<script> alert("Creacion Exitosa")</script>';
            $evaluacionD = $this->crearEvaluacionDocente($codigo, $id_evaluation);
            if ($evaluacionD == 0) {
                header('Location: views/docente/selfEvaluation.php');
                echo '<script> alert("Evaluacion Exitoso")</script>';
            } else {
                echo '<script> alert("Evaluacion Fallido")</script>';
            }
        } else {
            echo '<script> alert("Creacion Fallida")</script>';
        }
    }
}
?>