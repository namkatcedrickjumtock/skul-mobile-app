<?php
// session_start();

require_once("Dbh.php");

class StudentsClass extends Dbh{
    
    public function __construct(){
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {

            $_POST = filter_input_array(INPUT_POST,FILTER_SANITIZE_STRING);
            
            $_GET = filter_input_array(INPUT_GET,FILTER_SANITIZE_STRING);

            if (isset($_POST['createStudent'])) {
                
                

                $this->creatAccount();

            }elseif (isset($_POST['LogStudent'])) {

                $this->LogStudent();

            }
        }
        
        // checking get request from server
       
    }

    public function creatAccount(){
        
         //   geting variables from application
        
         $name = trim(strip_tags(stripslashes($_POST['name'])));
        
         $email = trim(strip_tags(stripslashes($_POST['mail'])));
         
         $tel = trim(strip_tags(stripslashes($_POST['tel'])));
         
         $pwd = trim(strip_tags(stripslashes($_POST['pwd'])));
         
        // echo json_encode($d = "arrived function");
         


            // checking if account exist
            
        $sqlstmt = "SELECT * FROM Applicant WHERE Email = ?";
        
        $prestmt = $this->ConnectDB()->prepare($sqlstmt);
        
        $prestmt->execute([$email]);
        
        $result  = $prestmt->fetch();
        
       if($result["ApplicantID"] >= 1){
           
                    $data = ["taken"];

              echo Json_encode("taken");
              
                     }
           else{
                
                $hashed_to_store = $this->hashPwd($pwd);
                
                // $url = "https/images/acounts/";
                
                $sqlInsert = 'INSERT INTO Applicant(Name, Email, tel, pwd) VALUES (?,?,?,?)';
                
                $sqlCon = $this->ConnectDB()->prepare($sqlInsert);
                
                $sqlCon->execute([$name,$email,$tel,$hashed_to_store]);
                
                $data = ["inserted"];
                
                echo json_encode("inserted");
            }
    }


    // login user
    public function LogStudent(){
        
        // variables from form
        $email = trim(strip_tags(stripslashes($_POST['mail'])));
        
        $pwd = trim(strip_tags(stripslashes($_POST['pwd'])));

        $sql = "SELECT * FROM Applicant  WHERE Email LIKE ?";
        
        $stmt = $this->ConnectDB()->prepare($sql);
        
        $stmt->execute([$email]);
        
        $result = $stmt->fetch();
        
        if ($result['ApplicantID'] >= 1 ) {
            
            $hpwd = $this->hashPwd($pwd);
            
            $dbPwd = $this->HashPwd($result['pwd']);
            
            if(password_verify($hpwd, $dbPwd)){
                
                echo Json_encode("verified");
                
            }
            
        }
            // else{ echo Json_encode("pwd_error");}
            
        // } else{
        //         echo Json_encode("not_exists");
        //     }
        }
        
    


    // password hasher
    public function hashPwd($pwd){
        
        $hashedPwd = password_hash($pwd,PASSWORD_BCRYPT);
        
        return $hashedPwd;
        
    }
   
}

$inst = new StudentsClass();