<%@ Page Title="登入" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebForms.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
    </hgroup>

    <div class="row-fluid">
        <div class="span7">
            <section id="loginForm">
                
                <fieldset class="form-horizontal">
                    <legend>使用本機帳戶進行登入。</legend>
                      <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-error">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="control-group">
                        <asp:Label runat="server" AssociatedControlID="UserName" CssClass="control-label">使用者名稱</asp:Label>
                        <div class="controls">
                            <asp:TextBox runat="server" ID="UserName" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                                CssClass="text-error" ErrorMessage="必須填寫使用者名稱欄位。" />
                        </div>
                    </div>
                    <div class="control-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="control-label">密碼</asp:Label>
                        <div class="controls">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-error" ErrorMessage="必須填寫密碼欄位。" />
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <label class="checkbox">
                                <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe">記住我?</asp:Label>
                            </label>
                        </div>
                    </div>
                    <div class="form-actions no-color">
                        <asp:Button runat="server" OnClick="LogIn" Text="登入" CssClass="btn" />
                    </div>
                </fieldset>
                <p>
                    <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">註冊</asp:HyperLink>
                    如果您沒有本機帳戶。
                </p>
            </section>
        </div>

        <div class="span5">
            <section id="socialLoginForm">
                <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
            </section>
        </div>
    </div>
</asp:Content>
