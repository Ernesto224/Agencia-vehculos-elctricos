/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package GUI;

import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author User
 */
public class JIFCarroCompras extends javax.swing.JInternalFrame {

    /**
     * Creates new form JIFCarroCompras
     */
    private JTable tablaAccesoriosPartes;
    private DefaultTableModel dftModeloTabla;
    private JScrollPane scrollPane;
    public JIFCarroCompras() {
        initComponents();
        this.dftModeloTabla = new DefaultTableModel();
        this.tablaAccesoriosPartes = new JTable();
        this.tablaAccesoriosPartes.setModel(this.dftModeloTabla);
        this.scrollPane = new JScrollPane(this.tablaAccesoriosPartes);
        this.scrollPane.setBounds(5, 10, 750, 400);
        this.add(this.scrollPane);
        this.crearTabla();
    }
    private void crearTabla() {
    try {
        this.dftModeloTabla.addColumn("Nombre");
        this.dftModeloTabla.addColumn("Cantidad");
        this.dftModeloTabla.addColumn("Precio");
    } catch (Exception e) {
        e.printStackTrace();
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

        jLabel1 = new javax.swing.JLabel();

        setClosable(true);
        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setMaximizable(true);

        jLabel1.setText("Carrito de compras.");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1, javax.swing.GroupLayout.DEFAULT_SIZE, 409, Short.MAX_VALUE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(296, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    // End of variables declaration//GEN-END:variables
}
