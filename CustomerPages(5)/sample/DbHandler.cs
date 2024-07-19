using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;

namespace sample
{
    public class DbHandler
    {
        private string connectionString = "Server=MYSQL8001.site4now.net;Database=db_a99cbb_alibert;Uid=a99cbb_alibert;Pwd=alibertwaters001";

        public DataTable GetDataTable(MySqlCommand cmd)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(connectionString))
                {
                    cmd.Connection = conn;
                    conn.Open();
                    MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
                    DataTable table = new DataTable();
                    adapter.Fill(table);

                    return table;
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        public int ExecuteUpdateQuery(MySqlCommand cmd)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(connectionString))
                {
                    cmd.Connection = conn;
                    conn.Open();
                    return cmd.ExecuteNonQuery();
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public int ExecuteInsertQuery(MySqlCommand cmd)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(connectionString))
                {
                    cmd.Connection = conn;
                    conn.Open();
                    return cmd.ExecuteNonQuery();
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}