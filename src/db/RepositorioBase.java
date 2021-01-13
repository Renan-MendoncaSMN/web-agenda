package db;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class RepositorioBase {

    private Conexao connection = null;
    private String procedure = "";
    private HashMap<Integer, Object> parametros = null;

    public RepositorioBase() throws SQLException, ClassNotFoundException {
        this.connection =  new Conexao();
    }

    protected void setProcedure(Object procedure) {
        this.procedure = procedure.toString();
        parametros = new HashMap<>();
    }

    protected void addParameter(Integer parameterIndex, Object value) {
        parametros.put(parameterIndex, value);
    }

    final CallableStatement buildQuery() throws SQLException {
        StringBuffer command = new StringBuffer("{ CALL " + procedure + "(");
        parametros.forEach((s, o) -> command.append("?,"));
        command.deleteCharAt(command.length() - 1);
        command.append(") }");
        CallableStatement statement = connection.prepareCall(command.toString());

        for (Map.Entry<Integer, Object> entry : parametros.entrySet()) {
            Integer parameterIndex = entry.getKey();
            Object value = entry.getValue();
            statement.setObject(parameterIndex, value);
        }

        return statement;
    }

    protected ResultSet executeQuery() throws SQLException {
        CallableStatement statement = buildQuery();
        return statement.executeQuery();
    }

    protected void executeVoidQuery() throws SQLException {
        buildQuery().executeUpdate();
    }
}
