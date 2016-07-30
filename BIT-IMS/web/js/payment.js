/* 
 * auther Amila Sankha
 */


function searchByPaymentID() {

    var paymentID = document.getElementById("searchPaymentID").value;
    alert(paymentID);
    paymentID = paymentID.trim();

    if (paymentID == "") {
        document.getElementById("searchPaymentIDErr").innerHTML = "Empty";
    } else {
        alert(paymentID);
        var httpxml;
        httpxml = new XMLHttpRequest();
        function stateChanged() {
            if (httpxml.readyState == 4) {
                document.getElementById("searchPaymentIDOutput").innerHTML = httpxml.responseText;
            }
        }
        var url = "../../SearchPayment";
        url = url + "?method=byID&input=" + paymentID;
        httpxml.onreadystatechange = stateChanged;
        httpxml.open("POST", url, true);
        httpxml.send(null);
    }

}

