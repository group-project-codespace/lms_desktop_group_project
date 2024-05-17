package gui;

import com.formdev.flatlaf.themes.FlatMacLightLaf;
import java.sql.ResultSet;
import java.util.Vector;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JFrame;
import model.connection;


public class AdminDetailsUpdate extends javax.swing.JFrame {

    public AdminDetailsUpdate() {
        initComponents();
        loadGender();
        loadPosition();
    }

    private void loadGender() {
        try {

            ResultSet resultSet = connection.execute("SELECT * FROM `gender`");

            Vector vector = new Vector();
            vector.add("Select");

            while (resultSet.next()) {
                vector.add(resultSet.getString("name"));
            }

            DefaultComboBoxModel defaultComboBoxModel = (DefaultComboBoxModel) jComboBox1.getModel();
            defaultComboBoxModel.removeAllElements();
            defaultComboBoxModel.addAll(vector);
            jComboBox1.setSelectedIndex(0);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void loadPosition() {
        try {

            ResultSet resultSet = connection.execute("SELECT * FROM `position`");

            Vector vector = new Vector();
            vector.add("Select");

            while (resultSet.next()) {
                vector.add(resultSet.getString("name"));
            }

            DefaultComboBoxModel defaultComboBoxModel = (DefaultComboBoxModel) jComboBox2.getModel();
            defaultComboBoxModel.removeAllElements();
            defaultComboBoxModel.addAll(vector);
            jComboBox2.setSelectedIndex(0);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

        public static void main(String args[]) {
        FlatMacLightLaf.setup();
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new AdminDetailsUpdate().setVisible(true);
            }
        });
    }
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jPanel2 = new javax.swing.JPanel();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        jPanel3 = new javax.swing.JPanel();
        jPanel4 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jTextField1 = new javax.swing.JTextField();
        jTextField3 = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jTextField5 = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        jComboBox1 = new javax.swing.JComboBox<>();
        jPanel5 = new javax.swing.JPanel();
        jLabel7 = new javax.swing.JLabel();
        jTextField7 = new javax.swing.JTextField();
        jTextField4 = new javax.swing.JTextField();
        jLabel8 = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        jComboBox2 = new javax.swing.JComboBox<>();
        jTextField8 = new javax.swing.JTextField();
        jLabel11 = new javax.swing.JLabel();
        jPasswordField1 = new javax.swing.JPasswordField();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setFont(new java.awt.Font("Liberation Sans", 1, 30)); // NOI18N
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("Admin Details Update");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel1, javax.swing.GroupLayout.DEFAULT_SIZE, 914, Short.MAX_VALUE)
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(17, 17, 17)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 57, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(26, Short.MAX_VALUE))
        );

        getContentPane().add(jPanel1, java.awt.BorderLayout.PAGE_START);

        jButton2.setBackground(new java.awt.Color(204, 0, 0));
        jButton2.setFont(jButton2.getFont().deriveFont(jButton2.getFont().getStyle() | java.awt.Font.BOLD, jButton2.getFont().getSize()+5));
        jButton2.setForeground(new java.awt.Color(255, 255, 255));
        jButton2.setText("Exit");
        jButton2.setBorder(null);
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jButton3.setBackground(new java.awt.Color(0, 204, 51));
        jButton3.setFont(jButton3.getFont().deriveFont(jButton3.getFont().getStyle() | java.awt.Font.BOLD, jButton3.getFont().getSize()+5));
        jButton3.setForeground(new java.awt.Color(255, 255, 255));
        jButton3.setText("Submit");
        jButton3.setBorder(null);
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                .addGap(70, 70, 70)
                .addComponent(jButton3, javax.swing.GroupLayout.PREFERRED_SIZE, 119, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(533, 533, 533)
                .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 119, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(70, 70, 70))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(25, 25, 25)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 47, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton3, javax.swing.GroupLayout.PREFERRED_SIZE, 47, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(30, 30, 30))
        );

        getContentPane().add(jPanel2, java.awt.BorderLayout.PAGE_END);

        jPanel3.setPreferredSize(new java.awt.Dimension(800, 500));
        jPanel3.setLayout(new java.awt.BorderLayout());

        jPanel4.setPreferredSize(new java.awt.Dimension(457, 550));

        jLabel2.setFont(jLabel2.getFont().deriveFont(jLabel2.getFont().getSize()+3f));
        jLabel2.setText("FirstName");

        jTextField1.setFont(jTextField1.getFont().deriveFont(jTextField1.getFont().getSize()+3f));

        jTextField3.setFont(jTextField3.getFont().deriveFont(jTextField3.getFont().getSize()+3f));

        jLabel4.setFont(jLabel4.getFont().deriveFont(jLabel4.getFont().getSize()+3f));
        jLabel4.setText("Mobile");

        jLabel5.setFont(jLabel5.getFont().deriveFont(jLabel5.getFont().getSize()+3f));
        jLabel5.setText("Gender");

        jTextField5.setFont(jTextField5.getFont().deriveFont(jTextField5.getFont().getSize()+3f));

        jLabel6.setFont(jLabel6.getFont().deriveFont(jLabel6.getFont().getSize()+3f));
        jLabel6.setText("NIC");

        jComboBox1.setFont(jComboBox1.getFont().deriveFont(jComboBox1.getFont().getSize()+3f));
        jComboBox1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addGap(70, 70, 70)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jLabel2)
                    .addComponent(jTextField1, javax.swing.GroupLayout.DEFAULT_SIZE, 314, Short.MAX_VALUE)
                    .addComponent(jTextField3, javax.swing.GroupLayout.DEFAULT_SIZE, 314, Short.MAX_VALUE)
                    .addComponent(jLabel4)
                    .addComponent(jLabel5)
                    .addComponent(jTextField5, javax.swing.GroupLayout.DEFAULT_SIZE, 314, Short.MAX_VALUE)
                    .addComponent(jLabel6)
                    .addComponent(jComboBox1, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addGap(38, 38, 38)
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jLabel4)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jTextField3, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(30, 30, 30)
                .addComponent(jLabel5)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(30, 30, 30)
                .addComponent(jLabel6)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jTextField5, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        jPanel3.add(jPanel4, java.awt.BorderLayout.LINE_START);

        jLabel7.setFont(jLabel7.getFont().deriveFont(jLabel7.getFont().getSize()+3f));
        jLabel7.setText("LastName");

        jTextField7.setFont(jTextField7.getFont().deriveFont(jTextField7.getFont().getSize()+3f));

        jTextField4.setFont(jTextField4.getFont().deriveFont(jTextField4.getFont().getSize()+3f));

        jLabel8.setFont(jLabel8.getFont().deriveFont(jLabel8.getFont().getSize()+3f));
        jLabel8.setText("Password");

        jLabel10.setFont(jLabel10.getFont().deriveFont(jLabel10.getFont().getSize()+3f));
        jLabel10.setText("Position");

        jLabel9.setFont(jLabel9.getFont().deriveFont(jLabel9.getFont().getSize()+3f));
        jLabel9.setText("Email");

        jComboBox2.setFont(jComboBox2.getFont().deriveFont(jComboBox2.getFont().getSize()+3f));
        jComboBox2.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));

        jTextField8.setFont(jTextField8.getFont().deriveFont(jTextField8.getFont().getSize()+3f));

        jLabel11.setFont(jLabel11.getFont().deriveFont(jLabel11.getFont().getSize()+3f));
        jLabel11.setText("Address");

        jPasswordField1.setFont(jPasswordField1.getFont().deriveFont(jPasswordField1.getFont().getSize()+3f));

        javax.swing.GroupLayout jPanel5Layout = new javax.swing.GroupLayout(jPanel5);
        jPanel5.setLayout(jPanel5Layout);
        jPanel5Layout.setHorizontalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel5Layout.createSequentialGroup()
                .addContainerGap(73, Short.MAX_VALUE)
                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jLabel7)
                    .addComponent(jTextField4)
                    .addComponent(jLabel8)
                    .addComponent(jTextField7)
                    .addComponent(jLabel9)
                    .addComponent(jLabel10)
                    .addComponent(jTextField8)
                    .addComponent(jLabel11)
                    .addComponent(jComboBox2, 0, 314, Short.MAX_VALUE)
                    .addComponent(jPasswordField1))
                .addGap(70, 70, 70))
        );
        jPanel5Layout.setVerticalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel5Layout.createSequentialGroup()
                .addGap(35, 35, 35)
                .addComponent(jLabel7)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jTextField4, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(30, 30, 30)
                .addComponent(jLabel8)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jPasswordField1, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(31, 31, 31)
                .addComponent(jLabel9)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jTextField7, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(30, 30, 30)
                .addComponent(jLabel10)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jComboBox2, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(30, 30, 30)
                .addComponent(jLabel11)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jTextField8, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(14, Short.MAX_VALUE))
        );

        jPanel3.add(jPanel5, java.awt.BorderLayout.CENTER);

        getContentPane().add(jPanel3, java.awt.BorderLayout.CENTER);

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        AdminDetails adminDetails = new AdminDetails();
        adminDetails.setExtendedState(JFrame.MAXIMIZED_BOTH);
        adminDetails.setVisible(true);
        this.dispose();
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        // TODO add your handling code here:
        AdminDetails adminDetails = new AdminDetails();
                adminDetails.setExtendedState(JFrame.MAXIMIZED_BOTH);
        adminDetails.setVisible(true);
        this.dispose();
    }//GEN-LAST:event_jButton3ActionPerformed

    /**
     * @param args the command line arguments
     */

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JComboBox<String> jComboBox1;
    private javax.swing.JComboBox<String> jComboBox2;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JPasswordField jPasswordField1;
    private javax.swing.JTextField jTextField1;
    private javax.swing.JTextField jTextField3;
    private javax.swing.JTextField jTextField4;
    private javax.swing.JTextField jTextField5;
    private javax.swing.JTextField jTextField7;
    private javax.swing.JTextField jTextField8;
    // End of variables declaration//GEN-END:variables
}
