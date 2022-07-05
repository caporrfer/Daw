/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validarContrasena(){
    
    var contrasena = document.getElementById("user_pass").value;
    var contrasena2 = document.getElementById("user_pass2").value;
    var spam = document.getElementById("spam");
    
    if (contrasena == contrasena2){
        spam.innerHTML="Las claves coinciden";
    }else{
        spam.innerHTML="Las claves no coinciden";
    }
    
}

