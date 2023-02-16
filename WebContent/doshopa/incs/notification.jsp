<div role="alert" aria-live="assertive" aria-atomic="true" class="toast bg-white fixed-bottom m-5 ms-auto"
    data-bs-autohide="false">
    <div class="toast-header">
        <img src="${pageContext.request.contextPath}/vendors/images/Doshopa32x32.png" class="rounded me-2" alt="...">
        <strong class="me-auto">Bootstrap</strong>
        <small>11 mins ago</small>
        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body">
        Hello, world! This is a toast message.
    </div>
</div>
<script>
    window.onload = (event) => {
        let myAlert = document.querySelector('.toast');
        let bsAlert = new bootstrap.Toast(myAlert);
        
        setTimeout(function () {
            bsAlert.show();
        }, 2000);
    };
</script>