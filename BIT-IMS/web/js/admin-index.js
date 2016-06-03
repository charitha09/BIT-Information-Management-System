/**
 *
 * @author amila
 */


function checkEmail(){
    var email = document.getElementById("cr_usr_email").value;
    alert(email);
    
    
    	$.ajax({
            url: 'https://Hp-Pavilion:8243/services/Weather?lat='+lat+'&lon='+lon,
            dataType: 'json',
            success: function(data) {
                document.getElementById('city').innerHTML =data['city'];             

				
                //alert(data['name']);
            },
             error: function() {
                $("#results").append("error");
                alert('error');
            }
        });
    
    
    
    
}
