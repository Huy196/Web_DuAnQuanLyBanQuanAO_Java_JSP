function loadProductPage() {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/view/ListProduct.jsp', true);
    xhr.onload = function() {
        if (xhr.status === 200) {
            document.getElementById('content').innerHTML = xhr.responseText;
        }
    };
    xhr.send();
}
function loadHome(){
    document.getElementById('content').innerHTML = `
        <img src="https://gotrangtri.vn/wp-content/uploads/2020/06/b%C3%ACa3.jpg" 
             alt="Background Image" 
             style="width: 98%; height: 100%; padding: 10px">
    `;
}
