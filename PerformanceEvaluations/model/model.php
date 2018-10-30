<?php
    class model{
        private $pdo;

        public function conexion(){
            $host = '127.0.0.1';
            $user = 'root';
            $password = '';
            $dataBase = 'bd_evaluations';

            try {
                $this->pdo = mysqli_connect($host, $user, $password, $dataBase);
                //echo '<script> alert("Conexion Establecida")</script>';
            }

            catch (Exception $exc) {
                mysqli_error($this->pdo);
                //echo '<script> alert("Fallo De Conexion")</script>';
            }
        }

        public function query($sql){
            return mysqli_query($this->pdo, $sql);
        }

        public function closeConexion(){
            mysqli_close($this->pdo);
            //echo '<script> alert("Conexion Cerrada")</script>';
        }
    }
?>