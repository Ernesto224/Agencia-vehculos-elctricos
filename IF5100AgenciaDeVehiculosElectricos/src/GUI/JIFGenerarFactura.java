/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JInternalFrame.java to edit this template
 */
package GUI;

import Data.BaseData;
import com.sun.jdi.connect.spi.Connection;
import javax.swing.JOptionPane;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import java.sql.CallableStatement;


public class JIFGenerarFactura extends javax.swing.JInternalFrame {

    /**
     * Creates new form JIFGenerarFactura
     */
    public JIFGenerarFactura() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jTextField1 = new javax.swing.JTextField();
        jButton1 = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jButton2 = new javax.swing.JButton();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jTextField3 = new javax.swing.JTextField();
        jTextField4 = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        jTextField5 = new javax.swing.JTextField();
        jLabel9 = new javax.swing.JLabel();
        jTextField2 = new javax.swing.JTextField();
        jLabel10 = new javax.swing.JLabel();

        setClosable(true);

        jLabel1.setFont(new java.awt.Font("Segoe UI", 1, 18)); // NOI18N
        jLabel1.setText("Generar Factura");

        jLabel2.setText("ID Cliente");

        jButton1.setText("Mostrar Pedidos");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "ID Pedido", "Fecha Pedido", "Estado Pedido", "Monto"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.Float.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, false, false
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane1.setViewportView(jTable1);
        if (jTable1.getColumnModel().getColumnCount() > 0) {
            jTable1.getColumnModel().getColumn(0).setResizable(false);
            jTable1.getColumnModel().getColumn(1).setResizable(false);
            jTable1.getColumnModel().getColumn(2).setResizable(false);
            jTable1.getColumnModel().getColumn(3).setResizable(false);
        }

        jButton2.setText("Generar Factura");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jLabel3.setText("Pedidos del cliente");

        jLabel4.setText("Dirección");

        jLabel5.setText("Proveedor");

        jTextField3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField3ActionPerformed(evt);
            }
        });

        jLabel6.setFont(new java.awt.Font("Segoe UI", 2, 10)); // NOI18N
        jLabel6.setText("(Opcional)");

        jLabel7.setFont(new java.awt.Font("Segoe UI", 2, 10)); // NOI18N
        jLabel7.setText("(Opcional)");

        jLabel8.setText("Tracking pedido");

        jLabel9.setFont(new java.awt.Font("Segoe UI", 2, 10)); // NOI18N
        jLabel9.setText("(Opcional)");

        jLabel10.setText("ID Pedido");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(212, 212, 212)
                .addComponent(jLabel1)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(layout.createSequentialGroup()
                .addGap(21, 21, 21)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel3)
                            .addGroup(layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel5)
                                    .addComponent(jLabel8)
                                    .addComponent(jLabel4))
                                .addGap(26, 26, 26)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addGroup(layout.createSequentialGroup()
                                        .addComponent(jTextField3, javax.swing.GroupLayout.DEFAULT_SIZE, 285, Short.MAX_VALUE)
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                        .addComponent(jLabel6))
                                    .addGroup(layout.createSequentialGroup()
                                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                            .addComponent(jTextField4, javax.swing.GroupLayout.DEFAULT_SIZE, 285, Short.MAX_VALUE)
                                            .addComponent(jTextField5))
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                            .addComponent(jLabel7)
                                            .addComponent(jLabel9))))))
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jButton2)
                            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                .addGroup(layout.createSequentialGroup()
                                    .addGap(6, 6, 6)
                                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 542, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGroup(layout.createSequentialGroup()
                                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                        .addComponent(jLabel10)
                                        .addComponent(jLabel2))
                                    .addGap(60, 60, 60)
                                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                        .addComponent(jTextField1, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.PREFERRED_SIZE, 285, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(jTextField2, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.PREFERRED_SIZE, 285, javax.swing.GroupLayout.PREFERRED_SIZE))
                                    .addGap(31, 31, 31)
                                    .addComponent(jButton1))))
                        .addGap(0, 25, Short.MAX_VALUE))))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addGap(49, 49, 49)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton1))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jTextField2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel10))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jTextField3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel6)
                    .addComponent(jLabel4))
                .addGap(13, 13, 13)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(jTextField4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel7))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel9)
                    .addComponent(jTextField5, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel8))
                .addGap(31, 31, 31)
                .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 393, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jButton2)
                .addContainerGap(15, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        // Obtener los datos de los campos de texto
    String text1 = jTextField1.getText();
    String text2 = jTextField2.getText();
    String text3 = jTextField3.getText();
    String text4 = jTextField4.getText();
    String text5 = jTextField5.getText();
    
    // Validar si el primer dato es un número entero válido
    int parametro1;
    int parametro2;
    try {
        parametro1 = Integer.parseInt(text1);
        parametro2 = Integer.parseInt(text2);
    } catch (NumberFormatException e) {
        // Mostrar un mensaje de error si el primer dato no es un número entero válido
        JOptionPane.showMessageDialog(this, "No es un número entero válido", "Error", JOptionPane.ERROR_MESSAGE);
        return; // Salir del método si hay un error
    }
    
    // Llamar al método para ejecutar el procedimiento almacenado
    generaFactura(parametro1, parametro2, text2, text3, text4);
    }//GEN-LAST:event_jButton2ActionPerformed

    private void generaFactura(int parametro1, int parametro2, String parametro3, String parametro4, String parametro5) {
     try {
        // Obtener la conexión a la base de datos
        BaseData baseData = new BaseData() {};
        java.sql.Connection connection = baseData.getSqlConnection();

        // Preparar la llamada al procedimiento almacenado
        String sql = "{? = call FinanzaVenta.sp_RegistrarFactura(?, ?, ?, ?, ?)}";
        CallableStatement callableStatement = connection.prepareCall(sql);

        // Registrar el parámetro de salida para el valor de retorno
        callableStatement.registerOutParameter(1, java.sql.Types.INTEGER);

        // Establecer los parámetros del procedimiento almacenado
        callableStatement.setInt(2, parametro1);
        callableStatement.setInt(3, parametro2);
        callableStatement.setString(4, parametro4);
        callableStatement.setString(5, parametro3);
        callableStatement.setString(6, parametro5);

        // Ejecutar el procedimiento almacenado
        callableStatement.execute();

        // Obtener el valor de retorno del procedimiento almacenado
        int resultado = callableStatement.getInt(1);

        // Cerrar la conexión
        connection.close();

        // Mostrar un mensaje con el valor de retorno y la información del pedido
        String mensaje;
        if (resultado == -1) {
            mensaje = "Error al generar la factura.\nEl pedido o el cliente no existen.";
        } else {
            mensaje = "Se ha generado la factura con éxito.\n\n" +
                      "ID de la Factura: " + resultado + "\n" +
                      "ID del Pedido: " + parametro1 + "\n" +
                      "ID del Cliente: " + parametro2 + "\n" +
                      "Proveedor de Envío: " + parametro4 + "\n" +
                      "ID de Dirección: " + parametro3 + "\n" +
                      "Tracking del Pedido: " + parametro5 + "\n";
        }
        JOptionPane.showMessageDialog(this, mensaje, "Factura Generada", JOptionPane.INFORMATION_MESSAGE);
         cargarDatos(parametro2);
         limpiar();
    } catch (SQLException ex) {
        // Mostrar un mensaje de error si ocurre alguna excepción SQL
        JOptionPane.showMessageDialog(this, "Error al ejecutar el procedimiento almacenado: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
    }
}
    
    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
    // Obtener el texto del campo de texto
    String text = jTextField1.getText();
    
    // Validar si el texto es un número entero válido
    try {
        int value = Integer.parseInt(text);
        // Si se llega aquí, el valor es un número entero válido
        // Llamar al método para cargar datos con el valor ingresado
        cargarDatos(value);
    } catch (NumberFormatException e) {
        // Mostrar un mensaje de error si el texto no es un número entero válido
        JOptionPane.showMessageDialog(this, "El valor ingresado no es un número entero válido", "Error", JOptionPane.ERROR_MESSAGE);
    }
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jTextField3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField3ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField3ActionPerformed
private void cargarDatos(int value) {
    DefaultTableModel modelo = new DefaultTableModel();
    modelo.addColumn("ID Pedido");
    modelo.addColumn("Fecha Pedido");
    modelo.addColumn("Estado de Pedido");
    modelo.addColumn("Monto");

   String sql = "{call FinanzaVenta.sp_ListarPedidosPendientesPorCliente(?)}";

    try {
        BaseData baseData = new BaseData() {};
        java.sql.Connection connection = baseData.getSqlConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        
        // Establecer el valor del parámetro en la consulta SQL
        preparedStatement.setInt(1, value);
        
        ResultSet resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            Object[] fila = new Object[4];
            fila[0] = resultSet.getInt("IDPedido");
            fila[1] = resultSet.getString("FechaPedido");
            fila[2] = resultSet.getString("EstadoPedido");
            fila[3] = resultSet.getFloat("MontoPedido");
            modelo.addRow(fila);
        }

        resultSet.close();
        preparedStatement.close();
        connection.close();

    } catch (Exception e) {
        e.printStackTrace();
    }

    jTable1.setModel(modelo);
}

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    private javax.swing.JTextField jTextField1;
    private javax.swing.JTextField jTextField2;
    private javax.swing.JTextField jTextField3;
    private javax.swing.JTextField jTextField4;
    private javax.swing.JTextField jTextField5;
    // End of variables declaration//GEN-END:variables

    private void limpiar() {
        jTextField2.setText("");
        jTextField3.setText("");
        jTextField4.setText("");
        jTextField5.setText("");
    }
}
