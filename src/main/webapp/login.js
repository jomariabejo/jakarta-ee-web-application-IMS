function login() {

    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;

    var xhr = new XMLHttpRequest();

    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                var response = xhr.responseText;
                var messageElement = document.getElementById("message");

                if (response === "VERIFIED GO TO HOMEPAGE NOW") {
                    messageElement.textContent = "Login successful!";

                    window.location.href = 'homepage.jsp';
                } else {
                    messageElement.textContent = "Login failed. Please check your credentials.";
                }
            } else {
                // err response
                var messageElement = document.getElementById("message");
                messageElement.textContent = "An error occurred. Please try again later.";
            }
        }
    };
    xhr.open("POST", "loginSubmitController", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send("username=" + encodeURIComponent(username) + "&password=" + encodeURIComponent(password));
}