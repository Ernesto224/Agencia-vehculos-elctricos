/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package GUI;

/**
 *
 * @author josue
 */
public class JFVentanPrincipal extends javax.swing.JFrame {

    private String puesto;
    public JFVentanPrincipal(String puesto) {
        initComponents();
        this.puesto = puesto.toLowerCase();
        this.puesto = "vendedor";
        switch (this.puesto) {
            case "vendedor":
                jm3.setVisible(true);
                jm5.setVisible(true);
                jm6.setVisible(true);
                jm7.setVisible(true);
                jmiVenta.setVisible(true);
                break;
            case "contador":
                jm3.setVisible(false);
                jm5.setVisible(true);
                jm6.setVisible(false);
                jm7.setVisible(false);
                jmiVenta.setVisible(false);
                break;
            case "Gerente de RRHH":
                break;
            default:
                jm3.setVisible(false);
                jm5.setVisible(false);
                jm6.setVisible(false);
                jm7.setVisible(false);
                jmiVenta.setVisible(false);
                break;
        }
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jDesktopPane1 = new javax.swing.JDesktopPane();
        jLabel1 = new javax.swing.JLabel();
        jMenuBar1 = new javax.swing.JMenuBar();
        jMenu1 = new javax.swing.JMenu();
        jmiVenta = new javax.swing.JMenuItem();
        jm3 = new javax.swing.JMenuItem();
        jm5 = new javax.swing.JMenuItem();
        jm6 = new javax.swing.JMenuItem();
        jm7 = new javax.swing.JMenuItem();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jDesktopPane1.setBackground(new java.awt.Color(152, 197, 197));

        jLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/logo.jpeg"))); // NOI18N

        jDesktopPane1.setLayer(jLabel1, javax.swing.JLayeredPane.DEFAULT_LAYER);

        javax.swing.GroupLayout jDesktopPane1Layout = new javax.swing.GroupLayout(jDesktopPane1);
        jDesktopPane1.setLayout(jDesktopPane1Layout);
        jDesktopPane1Layout.setHorizontalGroup(
            jDesktopPane1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jDesktopPane1Layout.createSequentialGroup()
                .addGap(226, 226, 226)
                .addComponent(jLabel1)
                .addContainerGap(316, Short.MAX_VALUE))
        );
        jDesktopPane1Layout.setVerticalGroup(
            jDesktopPane1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jDesktopPane1Layout.createSequentialGroup()
                .addGap(120, 120, 120)
                .addComponent(jLabel1)
<<<<<<< HEAD
                .addContainerGap(133, Short.MAX_VALUE))
=======
                .addContainerGap(255, Short.MAX_VALUE))
>>>>>>> d599c051a80280f8a99c05df24d7b8aa1e7f3214
        );

        jMenu1.setBackground(new java.awt.Color(0, 153, 204));
        jMenu1.setBorder(null);
        jMenu1.setForeground(new java.awt.Color(0, 0, 0));
        jMenu1.setText("Gestionar");

        jmiVenta.setFont(new java.awt.Font("Arial Black", 0, 12)); // NOI18N
        jmiVenta.setForeground(new java.awt.Color(0, 0, 0));
        jmiVenta.setText("Venta");
        jmiVenta.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jmiVentaActionPerformed(evt);
            }
        });
        jMenu1.add(jmiVenta);

        jm3.setFont(new java.awt.Font("Arial Black", 0, 12)); // NOI18N
        jm3.setForeground(new java.awt.Color(0, 0, 0));
        jm3.setText("Generar Factura");
        jm3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jm3ActionPerformed(evt);
            }
        });
        jMenu1.add(jm3);

        jm5.setFont(new java.awt.Font("Arial Black", 0, 12)); // NOI18N
        jm5.setForeground(new java.awt.Color(0, 0, 0));
        jm5.setText("Listar  Vehículos Vendidos");
        jm5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jm5ActionPerformed(evt);
            }
        });
        jMenu1.add(jm5);

        jm6.setFont(new java.awt.Font("Arial Black", 0, 12)); // NOI18N
        jm6.setForeground(new java.awt.Color(0, 0, 0));
        jm6.setText("Generar Pedido");
        jm6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jm6ActionPerformed(evt);
            }
        });
        jMenu1.add(jm6);

        jm7.setFont(new java.awt.Font("Arial Black", 0, 12)); // NOI18N
        jm7.setForeground(new java.awt.Color(0, 0, 0));
        jm7.setText("Registrar Cliente");
        jm7.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jm7ActionPerformed(evt);
            }
        });
        jMenu1.add(jm7);

        jMenuBar1.add(jMenu1);

        setJMenuBar(jMenuBar1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jDesktopPane1)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jDesktopPane1)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jm3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jm3ActionPerformed
        JIFGenerarFactura jIFGenerarFactura = new JIFGenerarFactura();
        jDesktopPane1.add(jIFGenerarFactura);
        jIFGenerarFactura.setVisible(true);
    }//GEN-LAST:event_jm3ActionPerformed

    private void jm6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jm6ActionPerformed
        JIFReservarProducto jIFReservarProducto = new JIFReservarProducto();
        jDesktopPane1.add(jIFReservarProducto);
        jIFReservarProducto.setVisible(true);
    }//GEN-LAST:event_jm6ActionPerformed

    private void jm7ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jm7ActionPerformed
       JIFRegistrarCliente jIFRegistrarCliente = new JIFRegistrarCliente();
       jDesktopPane1.add(jIFRegistrarCliente);
       jIFRegistrarCliente.setVisible(true);
    }//GEN-LAST:event_jm7ActionPerformed

    private void jm5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jm5ActionPerformed
//        JIFListarVehiculos jIFListarVehiculos = new JIFListarVehiculos();
//        jDesktopPane1.add(jIFListarVehiculos);
//        jIFListarVehiculos.setVisible(true);
    }//GEN-LAST:event_jm5ActionPerformed

    private void jmiVentaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jmiVentaActionPerformed
        // TODO add your handling code here:
        JIFVentaProducto ventaProducto = new JIFVentaProducto();
        jDesktopPane1.add(ventaProducto);
        ventaProducto.setVisible(true);
    }//GEN-LAST:event_jmiVentaActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(JFVentanPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(JFVentanPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(JFVentanPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(JFVentanPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new JFVentanPrincipal("").setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JDesktopPane jDesktopPane1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenuItem jm3;
    private javax.swing.JMenuItem jm5;
    private javax.swing.JMenuItem jm6;
    private javax.swing.JMenuItem jm7;
    private javax.swing.JMenuItem jmiVenta;
    // End of variables declaration//GEN-END:variables
}
