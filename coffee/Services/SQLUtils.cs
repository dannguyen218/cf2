using System;
using System.Data.SqlClient;

namespace coffee.Services
{
    public static class SQLUtils
    {
        public static string _connStr;

        #region Helpers
        public static void ExecuteCommand(string connStr, Action<SqlConnection> task)
        {
            using (var conn = new SqlConnection(connStr))
            {
                conn.Open();

                task(conn);
            }
        }
        public static T ExecuteCommand<T>(string connStr, Func<SqlConnection, T> task)
        {
            using (var conn = new SqlConnection(connStr))
            {
                conn.Open();

                return task(conn);
            }
        }
        #endregion
    }
}
