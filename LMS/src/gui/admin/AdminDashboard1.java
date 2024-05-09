package gui.admin;
import gui.components.adminPages.*;
/**
 * @author terminal
 */
public class AdminDashboard1 extends javax.swing.JFrame {
 AdminDashboardPage admindashboardpage = new AdminDashboardPage(); 
        ManageAdminsPage manageadminpage = new ManageAdminsPage();
    
    public AdminDashboard1() {
        initComponents();
       

    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        adminDashboardPageVariable = new gui.components.adminPages.AdminDashboardPage();
        manageAdminsVariable = new gui.components.adminPages.ManageAdminsPage();
        mainAdminDivVariable = new gui.components.MainAdminDiv();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());
        getContentPane().add(adminDashboardPageVariable, new org.netbeans.lib.awtextra.AbsoluteConstraints(280, 0, 810, -1));
        getContentPane().add(manageAdminsVariable, new org.netbeans.lib.awtextra.AbsoluteConstraints(280, 0, 860, 570));

        mainAdminDivVariable.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                mainAdminDivVariableMouseClicked(evt);
            }
        });
        getContentPane().add(mainAdminDivVariable, new org.netbeans.lib.awtextra.AbsoluteConstraints(6, -4, 1090, 560));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void mainAdminDivVariableMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_mainAdminDivVariableMouseClicked
admindashboardpage.setVisible(true);
manageadminpage.setVisible(false);



    }//GEN-LAST:event_mainAdminDivVariableMouseClicked

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
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
            java.util.logging.Logger.getLogger(AdminDashboard1.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(AdminDashboard1.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(AdminDashboard1.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(AdminDashboard1.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        
        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new AdminDashboard1().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private gui.components.adminPages.AdminDashboardPage adminDashboardPageVariable;
    private gui.components.MainAdminDiv mainAdminDivVariable;
    private gui.components.adminPages.ManageAdminsPage manageAdminsVariable;
    // End of variables declaration//GEN-END:variables
}
