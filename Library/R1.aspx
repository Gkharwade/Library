<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="R1.aspx.cs" Inherits="Library.R1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <style>
        @import '~mdb-ui-kit/css/mdb.min.css';

        .gradient-custom-4 {
            /* fallback for old browsers */
            background: #84fab0;
            /* Chrome 10-25, Safari 5.1-6 */
            background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1));
            /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            background: linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1))
        }
    </style>

       <div class="mask d-flex align-items-center h-100 gradient-custom-3">
        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                    <div class="card" style="border-radius: 15px;">
                        <div class="card-body p-5">
                            <h2 class="text-uppercase text-center mb-5">Create an account</h2>



                            <div data-mdb-input-init="" class="form-outline mb-4">
                                <input type="text" runat="server" id="Email1" class="form-control form-control-lg" />
                                <label class="form-label" for="Email1">Enter Your Username</label>
                            </div>

                            <div data-mdb-input-init="" class="form-outline mb-4">
                                <input type="password" runat="server" id="PWD" class="form-control form-control-lg" />
                                <label class="form-label" for="PWD">Password</label>
                            </div>

                            <div data-mdb-input-init="" class="form-outline mb-4">
                                <input type="text" runat="server" id="role" class="form-control form-control-lg" />
                                <label class="form-label" for="role">Enter your Role</label>
                            </div>

                            <div class="form-check d-flex justify-content-center mb-5">
                                <input class="form-check-input me-2" runat="server" type="checkbox" value="" id="form2Example3cg" />
                                <label class="form-check-label" for="form2Example3g">
                                    I agree all statements in <a href="#!" class="text-body"><u>Terms of service</u></a>
                                </label>
                            </div>

                            <div class="d-flex justify-content-center">
                                <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-success btn-block btn-lg gradient-custom-4 text-body" ToolTip="Submit" OnClick="Unnamed_Click"/>  
                            </div>

                           <%-- <div class="d-flex justify-content-center">
                                <button type="button" data-mdb-button-init=""
                                    data-mdb-ripple-init="" runat="server"  class="btn btn-success btn-block btn-lg gradient-custom-4 text-body"
                                    onclick="Unnamed_Click" > Register</button>
                            </div>--%>

                            <p class="text-center text-muted mt-5 mb-0">
                                Have already an account? <a href="Login"
                                    class="fw-bold text-body"><u>Login here</u></a>
                            </p>


                            <script>

                                const PWD = document.querySelector('#password');

                                const RepeatPWD = document.querySelector('#repeat-password');

                                const validate = () => {
                                    if (PWD.value !== RepeatPWD.value) {
                                        repPass.setCustomValidity('The two passwords do not match');

                                        return;

                                        RepeatPWD.setCustomValidity('');

                                        PWD.addEventListener('change', validate);

                                        RepeatPWD.addEventListener('change',
                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
