using System.Windows;
using Session1_01.DataSetTableAdapters;

namespace Session1_01
{
    public partial class Admin : Window
    {
        DataSet dataSet = new DataSet();
        UsersTableAdapter usersTA = new UsersTableAdapter();
        public Admin()
        {
            InitializeComponent();
            usersTA.Fill(dataSet.Users);
            dataGrid.ItemsSource = dataSet.Users.DefaultView;
        }

        private void ExitBtn_Click(object sender, RoutedEventArgs e)
        {
            MainWindow window = new MainWindow();
            window.Show();
            Close();
        }
    }
}
