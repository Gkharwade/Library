<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Library.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  
    <style>
    .center {
        display: flex;
        justify-content:normal;
        align-items: normal;
        height: 100vh; /* Full viewport height */
        padding-top: 80px;
    }
</style>

    <div class="center">

  

    <div class="form login">

      <header class="login__header">
        <h3 class="login__title">Login</h3>
      </header>

      <div class="login__body">

          <div class="mb-3">
      <label for="email_id" class="form-label">Email address</label>
      <input type="text" runat="server" id="email_id" class="form-control" aria-describedby="emailHelp" />
     
  </div>

         <div class="mb-3">
     <label for="Password1" class="form-label">Password</label>
     <input type="password" runat="server" class="form-control" id="Password1" />
 </div>
           </div>

        <div class="mb-3">
    <label for="ROLE" class="form-label">Role</label>
    <input type="text" runat="server" class="form-control" id="ROLE" />
</div>
      </div>

      <div class="login__footer">
        <asp:Button type="button" Text="Submit"  runat="server" onclick="Submit" value="Login"/>

        <p><span class="icon icon--info">?</span><a href="#">Forgot Password</a></p>
 </div>
      </div>


 


</asp:Content>
