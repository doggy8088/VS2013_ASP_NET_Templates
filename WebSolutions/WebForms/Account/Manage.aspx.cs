using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;

namespace WebForms.Account
{
    public partial class Manage : System.Web.UI.Page
    {
        protected string SuccessMessage
        {
            get;
            private set;
        }

        protected bool CanRemoveExternalLogins
        {
            get;
            private set;
        }

        protected void Page_Load()
        {
            if (!IsPostBack)
            {
                // 決定要呈現的區段
                ILoginManager manager = new IdentityManager(new IdentityStore()).Logins;
                if (manager.HasLocalLogin(User.Identity.GetUserId())) 
                {
                    changePasswordHolder.Visible = true;
                }
                else 
                {
                    setPassword.Visible = true;
                    changePasswordHolder.Visible = false;
                }
                CanRemoveExternalLogins = manager.GetLogins(User.Identity.GetUserId()).Count() > 1;

                // 呈現成功訊息
                var message = Request.QueryString["m"];
                if (message != null) 
                {
                    // 使查詢字串脫離動作
                    Form.Action = ResolveUrl("~/Account/Manage");

                    SuccessMessage =
                        message == "ChangePwdSuccess" ? "您的密碼已變更。"
                        : message == "SetPwdSuccess" ? "您的密碼已設定。"
                        : message == "RemoveLoginSuccess" ? "帳戶已移除。"
                        : String.Empty;
                    successMessage.Visible = !String.IsNullOrEmpty(SuccessMessage);
                }
            }
        }

        protected void ChangePassword_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                IPasswordManager manager = new IdentityManager(new IdentityStore()).Passwords;
                IdentityResult result = manager.ChangePassword(User.Identity.GetUserName(), CurrentPassword.Text, NewPassword.Text);
                if (result.Success) 
                {
                    Response.Redirect("~/Account/Manage?m=ChangePwdSuccess");
                }
                else 
                {
                    AddErrors(result);
                }
            }
        }

        protected void SetPassword_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // 建立本機登入資訊並將本機帳戶連結到使用者
                ILoginManager manager = new IdentityManager(new IdentityStore()).Logins;
                IdentityResult result = manager.AddLocalLogin(User.Identity.GetUserId(), User.Identity.GetUserName(), password.Text);
                if (result.Success) 
                {
                    Response.Redirect("~/Account/Manage?m=SetPwdSuccess");
                }
                else 
                {
                    AddErrors(result);
                }
            }
        }

        public IEnumerable<IUserLogin> GetLogins()
        {
            ILoginManager manager = new IdentityManager(new IdentityStore()).Logins;
            var accounts = manager.GetLogins(User.Identity.GetUserId());
            CanRemoveExternalLogins = accounts.Count() > 1;
            return accounts;
        }

        public void RemoveLogin(string loginProvider, string providerKey)
        {
            ILoginManager manager = new IdentityManager(new IdentityStore()).Logins;
            var result = manager.RemoveLogin(User.Identity.GetUserId(), loginProvider, providerKey);
            var msg = result.Success
                ? "?m=RemoveLoginSuccess"
                : String.Empty;
            Response.Redirect("~/Account/Manage" + msg);
        }

        private void AddErrors(IdentityResult result) {
            foreach (var error in result.Errors) {
                ModelState.AddModelError("", error);
            }
        }
    }
}