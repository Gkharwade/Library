<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="transaction.aspx.cs" Inherits="Library.transaction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <meta charset="UTF-8">

   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <div class="position-fixed top-0 end-0 p-3" style="z-index: 11">
    <div id="toastMessage" class="toast align-items-center text-white bg-success border-0" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex">
            <div class="toast-body">
                <span id="toastText">Operation Successful!</span>
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
</div>


    <h2>Library Transactions</h2>
    <style>
body { 
    font-family: Arial, sans-serif; 
    text-align: center; 
    background-color: #f4f4f4; 
    display: flex; 
    justify-content: center; 
    align-items: center; 
    height: 100vh; 
    margin: 0;
}

.component { 
    width: 800px;  /* Increased width to fit both sections */
    padding: 20px; 
    background: white; 
    border-radius: 10px; 
    box-shadow: 0px 0px 10px gray; 
    text-align: center;
}

.form-component {
    display: flex; /* Display side by side */
    justify-content: space-between;
}

.form-box {
    width: 45%; /* Adjust width to fit within container */
    padding: 15px;
    border: 1px solid #ccc;
    border-radius: 10px;
    background-color: #fff;
    box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
}

input { 
    width: 100%; 
    padding: 10px; 
    margin: 10px 0; 
    border: 1px solid #ccc; 
    border-radius: 4px; 
}

button { 
    background-color: green; 
    color: white; 
    padding: 12px; 
    width: 100%; 
    border: none; 
    cursor: pointer; 
    border-radius: 5px; 
    font-size: 16px;
}

button:hover { 
    background-color: darkgreen; 
}

    </style>



   <div class="component">
   
    <div class="form-component">
        <!-- Issue Book Section -->
        <div class="form-box">
            <h3>Issue Book</h3>
            <input type="text" id="BookId" runat="server" placeholder="Book ID">
            <input type="text" id="MemberId" runat="server" placeholder="Member ID">
            <asp:Button ID="IssueButton" runat="server" Text="Issue Book" OnClick="IssueBook" />
        </div>

        <!-- Return Book Section -->
        <div class="form-box">
            <h3>Return Book</h3>
            <input type="text" id="ReturnBookId" runat="server" placeholder="Book ID">
            <input type="text" id="ReturnMemberId" runat="server" placeholder="Member ID">
            <asp:Button ID="ReturnButton" runat="server" Text="Return Book" OnClick="ReturnBook" />
        </div>
    </div>
</div>

    <script>
    function showToast(message, type) {
        let toastElement = document.getElementById('toastMessage');
        let toastText = document.getElementById('toastText');

        // Set message & background color based on type
        toastText.innerText = message;
        toastElement.classList.remove('bg-success', 'bg-danger', 'bg-warning', 'bg-info');
        toastElement.classList.add('bg-' + type);

        // Show toast
        let toast = new bootstrap.Toast(toastElement);
        toast.show();
    }
    </script>

    <div class="content">
    <h2>Welcome to Library Management</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="gridview-custom table table-bordered"  AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5">
             <Columns>
                 <asp:BoundField DataField="BookId" HeaderText="Book ID" ReadOnly="True" />
                 <asp:BoundField DataField="Title" HeaderText="Title" />
                 <asp:BoundField DataField="Author" HeaderText="Author" />
                 <asp:BoundField DataField="ISBN" HeaderText="ISBN" />
                 <asp:BoundField DataField="Publisher" HeaderText="Publisher" />
                 <asp:BoundField DataField="Category" HeaderText="Category" />
                 <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
             </Columns>
         </asp:GridView>
</div>


   

    <style>
        /* Centering the GridView */
        .grid-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Full viewport height */
        }
        .table-container {
            width: 80%; /* You can adjust the width as per your preference */
            margin: 0 auto;
            
        }
    </style>


</asp:Content>
