using System.Windows;
using Session1_01.DataSetTableAdapters;

namespace Session1_01
{
    public partial class MainWindow : Window
    {
        DataSet dataSet = new DataSet();
        UsersTableAdapter usersTA = new UsersTableAdapter();
        public MainWindow()
        {
            InitializeComponent();
            usersTA.Fill(dataSet.Users);
        }

        private void LoginBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (PasswordPB.Password != "" && PasswordPB != null && UserNameTB.Text != "" && UserNameTB.Text != null)
                {
                    for (int i = 0; dataSet.Users.Rows.Count > i; i++)
                    {
                        if (dataSet.Users.Rows[i][2].ToString() == UserNameTB.Text&& dataSet.Users.Rows[i][3].ToString() == PasswordPB.Password)
                        {
                            if (dataSet.Users.Rows[i][1].ToString() == "1")
                            {
                                Admin window = new Admin();
                                window.Show();
                            }
                            else
                            {
                                User window = new User();
                                window.Show();
                            }
                            Close();
                        }
                    }
                }
            }
            catch { MessageBox.Show("Произошла ошибка"); }
        }

        private void ExitBtn_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }
    }
}
