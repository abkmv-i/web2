function CLEAR() {
    clear = document.getElementById("clearR");
    clear.onclick = function (event) {
        localStorage.clear()
    }
}
CLEAR();