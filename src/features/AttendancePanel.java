/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package features;
import java.awt.BorderLayout; // Make sure this import is present
/**
 *
 * Original project contributors
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

public class AttendancePanel extends javax.swing.JFrame {
    
    private static final java.util.logging.Logger logger = java.util.logging.Logger.getLogger(AttendancePanel.class.getName());
    private DefaultTableModel model;
    /**
     * Creates new form AttendancePanel
     */
    public AttendancePanel() {
        initComponents();
        this.setLocationRelativeTo(null); // Center on screen
        this.setExtendedState(MAXIMIZED_BOTH); // Full screen
        
        // 1. Initialize the table and UI when first opened
        setupTable();
        loadAttendanceData();
        
        // 2. Set today's date automatically
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        dateField.setText(sdf.format(new Date()));
        
        // 3. Lock fields to prevent manual editing
        dateField.setEditable(false);
        nameField.setEditable(false);
        
        // 4. Focus the cursor on the ID field
        employeeIdField.requestFocus();
    }
    
    public AttendancePanel(int userId, String name) {
        this(); // Call the main constructor so initialization runs
    }
    
        // ========================================================================
    // LOGIC SECTION (DATABASE & FUNCTIONS)
    // ========================================================================

    /**
     * Configure table headers and make cells read-only
     */
    private void setupTable() {
        String[] columnTitles = {"Employee ID", "Name", "Date", "Time", "Status", "Reason"};
        model = new DefaultTableModel(null, columnTitles) {
            @Override
            public boolean isCellEditable(int row, int column) {
                return false; // All sel dikunci
            }
        };
        attendanceTable.setModel(model);
    }

    /**
     * Display attendance history from the database in the table
      *
     */
    private void loadAttendanceData() {
        // Clear existing rows
        model.setRowCount(0);
        


        String sql = "SELECT u.user_id, u.name, a.work_date, a.check_in_time, a.status, a.notes " +
                     "FROM attendance a " +
                     "JOIN users u ON a.employee_id = u.user_id " +
                     "ORDER BY a.check_in_time DESC";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Object[] rowData = {
                    rs.getInt("user_id"),
                    rs.getString("name"),
                    rs.getDate("work_date"),
                    rs.getTime("check_in_time"),
                    rs.getString("status"),
                    rs.getString("notes")
                };
                model.addRow(rowData);
            }
        } catch (SQLException e) {
            logger.severe("Failed to load table: " + e.getMessage());
        }
    }

    /**
      *
      *
     */
    private void findEmployeeName() {
        String idInput = employeeIdField.getText();
        
        if (idInput.isEmpty()) return;


        String sql = "SELECT name FROM users WHERE user_id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, Integer.parseInt(idInput));
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {

                nameField.setText(rs.getString("name"));
                reasonField.requestFocus(); // Pindah kursor ke reason
            } else {
                JOptionPane.showMessageDialog(this, "Employee ID not found!", "Error", JOptionPane.ERROR_MESSAGE);
                nameField.setText("");
                employeeIdField.requestFocus();
            }
            
        } catch (NumberFormatException e) {
             JOptionPane.showMessageDialog(this, "ID must be a number!", "Error", JOptionPane.ERROR_MESSAGE);
        } catch (SQLException e) {
            logger.severe("Employee search error: " + e.getMessage());
        }
    }

    /**
      *
      *
     */
    private void saveAttendance() {
        String idStr = employeeIdField.getText();
        String status = attendanceStatusCombo.getSelectedItem().toString();
        String reason = reasonField.getText();
        
        // Validate input
        if (idStr.isEmpty() || nameField.getText().isEmpty()) {
            JOptionPane.showMessageDialog(this, "Please enter the Employee ID and press Enter!", "Warning", JOptionPane.WARNING_MESSAGE);
            return;
        }
        

        if ((status.equalsIgnoreCase("Sick") || status.equalsIgnoreCase("Excused")) && reason.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Please enter a reason for Sick/Excused status.", "Warning", JOptionPane.WARNING_MESSAGE);
            return;
        }


        // Kolom: employee_id, work_date, check_in_time, status, notes
        String sql = "INSERT INTO attendance (employee_id, work_date, check_in_time, status, notes) VALUES (?, CURDATE(), NOW(), ?, ?)";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, Integer.parseInt(idStr));



            stmt.setString(2, status); 
            stmt.setString(3, reason);
            
            int rowsAffected = stmt.executeUpdate();
            
            if (rowsAffected > 0) {
                JOptionPane.showMessageDialog(this, "Attendance saved successfully!");
                loadAttendanceData();
                
                // Reset form
                employeeIdField.setText("");
                nameField.setText("");
                reasonField.setText("");
                attendanceStatusCombo.setSelectedIndex(0);
                employeeIdField.requestFocus();
            }
            
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(this, "Failed to save: " + e.getMessage());
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

        jColorChooser1 = new javax.swing.JColorChooser();
        jPanel2 = new javax.swing.JPanel();
        jPanel3 = new javax.swing.JPanel();
        jLabel10 = new javax.swing.JLabel();
        jPanel4 = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        exitBT = new javax.swing.JButton();
        jPanel6 = new features.RoundedPanel(30) ;
        lb = new javax.swing.JLabel();
        jPanel1 = new features.RoundedPanel(30) ;
        jLabel4 = new javax.swing.JLabel();
        employeeIdField = new features.RoundedTextField();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        reasonField = new features.RoundedTextField();
        nameField = new features.RoundedTextField();
        submitAttendanceButton = new javax.swing.JButton();
        attendanceStatusCombo = new javax.swing.JComboBox<>();
        jLabel7 = new javax.swing.JLabel();
        dateField = new features.RoundedTextField();
        jPanel7 = new features.RoundedPanel(30) ;
        attendanceLabel = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        attendanceTable = new javax.swing.JTable();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel3.setBackground(new java.awt.Color(211, 218, 217));

        jLabel10.setIcon(new javax.swing.ImageIcon(getClass().getResource("/images/attendance.png"))); // NOI18N

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addGap(16, 16, 16)
                .addComponent(jLabel10)
                .addContainerGap(20, Short.MAX_VALUE))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel10)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jPanel4.setBackground(new java.awt.Color(113, 90, 90));

        jLabel3.setFont(new java.awt.Font("Segoe UI", 1, 18)); // NOI18N
        jLabel3.setText("Hello, Employee!");

        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/images/user_17740782.png"))); // NOI18N

        exitBT.setIcon(new javax.swing.ImageIcon(getClass().getResource("/images/log-out.png"))); // NOI18N
        exitBT.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                exitBTActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addGap(17, 17, 17)
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel3)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(exitBT, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(20, 20, 20))
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addContainerGap(18, Short.MAX_VALUE)
                .addComponent(jLabel2)
                .addGap(15, 15, 15))
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addGap(36, 36, 36)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(exitBT, javax.swing.GroupLayout.PREFERRED_SIZE, 38, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel3))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jPanel6.setBackground(new java.awt.Color(68, 68, 78));

        lb.setFont(new java.awt.Font("Segoe UI", 1, 24)); // NOI18N
        lb.setForeground(new java.awt.Color(255, 255, 255));
        lb.setText("Attendance");

        javax.swing.GroupLayout jPanel6Layout = new javax.swing.GroupLayout(jPanel6);
        jPanel6.setLayout(jPanel6Layout);
        jPanel6Layout.setHorizontalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel6Layout.createSequentialGroup()
                .addGap(19, 19, 19)
                .addComponent(lb)
                .addContainerGap(17, Short.MAX_VALUE))
        );
        jPanel6Layout.setVerticalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(lb, javax.swing.GroupLayout.DEFAULT_SIZE, 40, Short.MAX_VALUE)
        );

        jPanel1.setBackground(new java.awt.Color(217, 217, 217));

        jLabel4.setText("Employee ID");

        employeeIdField.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                idEmployeeTFActionPerformed(evt);
            }
        });
        employeeIdField.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                idEmployeeTFKeyPressed(evt);
            }
        });

        jLabel5.setText("Name");

        jLabel6.setText("Date");

        reasonField.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                reasonFieldActionPerformed(evt);
            }
        });

        nameField.setBackground(new java.awt.Color(153, 153, 153));
        nameField.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                nameFieldActionPerformed(evt);
            }
        });

        submitAttendanceButton.setText("Submit");
        submitAttendanceButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                submitAttendanceButtonActionPerformed(evt);
            }
        });

        attendanceStatusCombo.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Present", "Excused", "Sick", "Absent" }));
        attendanceStatusCombo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                attendanceStatusComboActionPerformed(evt);
            }
        });

        jLabel7.setText("Reason");

        dateField.setBackground(new java.awt.Color(153, 153, 153));
        dateField.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                dateFieldActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(reasonField)
                            .addComponent(nameField)
                            .addComponent(employeeIdField)
                            .addComponent(dateField)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel7)
                                    .addComponent(jLabel6)
                                    .addComponent(jLabel5))
                                .addGap(0, 0, Short.MAX_VALUE))))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(130, 130, 130)
                                .addComponent(submitAttendanceButton, javax.swing.GroupLayout.PREFERRED_SIZE, 144, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(attendanceStatusCombo, javax.swing.GroupLayout.PREFERRED_SIZE, 259, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addGap(0, 126, Short.MAX_VALUE)))
                .addContainerGap())
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel4)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(26, 26, 26)
                .addComponent(jLabel4)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(employeeIdField, javax.swing.GroupLayout.PREFERRED_SIZE, 34, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel5)
                .addGap(5, 5, 5)
                .addComponent(nameField, javax.swing.GroupLayout.PREFERRED_SIZE, 34, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(12, 12, 12)
                .addComponent(jLabel6)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(dateField, javax.swing.GroupLayout.PREFERRED_SIZE, 34, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(attendanceStatusCombo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(12, 12, 12)
                .addComponent(jLabel7)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(reasonField, javax.swing.GroupLayout.PREFERRED_SIZE, 34, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(submitAttendanceButton)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jPanel7.setBackground(new java.awt.Color(217, 217, 217));

        attendanceLabel.setText("Employee Attendance Records");

        attendanceTable.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Employee ID", "Name", "Date", "Time"
            }
        ));
        jScrollPane1.setViewportView(attendanceTable);

        javax.swing.GroupLayout jPanel7Layout = new javax.swing.GroupLayout(jPanel7);
        jPanel7.setLayout(jPanel7Layout);
        jPanel7Layout.setHorizontalGroup(
            jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel7Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel7Layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addComponent(attendanceLabel)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 669, Short.MAX_VALUE))
                .addContainerGap())
        );
        jPanel7Layout.setVerticalGroup(
            jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel7Layout.createSequentialGroup()
                .addGap(14, 14, 14)
                .addComponent(attendanceLabel)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 459, Short.MAX_VALUE)
                .addContainerGap())
        );

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(jPanel6, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jPanel7, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addComponent(jPanel4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(jPanel6, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jPanel7, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                    .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(18, 18, 18))
        );

        getContentPane().add(jPanel2, java.awt.BorderLayout.CENTER);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void submitAttendanceButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_submitAttendanceButtonActionPerformed
        saveAttendance(); 
    }//GEN-LAST:event_submitAttendanceButtonActionPerformed

    private void exitBTActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_exitBTActionPerformed
         int answer = javax.swing.JOptionPane.showConfirmDialog(
            this, 
            "Are you sure you want to return to the Dashboard?", 
            "Confirmation", 
            javax.swing.JOptionPane.YES_NO_OPTION, 
            javax.swing.JOptionPane.QUESTION_MESSAGE
        );
        
        if (answer == javax.swing.JOptionPane.YES_OPTION) {
            new EmployeeDashboard(1, "Employee").setVisible(true); 
            this.dispose();
        }
    }//GEN-LAST:event_exitBTActionPerformed

    private void nameFieldActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_nameFieldActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_nameFieldActionPerformed

    private void idEmployeeTFActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_idEmployeeTFActionPerformed
        findEmployeeName(); 
    }//GEN-LAST:event_idEmployeeTFActionPerformed

    private void reasonFieldActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_reasonFieldActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_reasonFieldActionPerformed

    private void attendanceStatusComboActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_attendanceStatusComboActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_attendanceStatusComboActionPerformed

    private void dateFieldActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_dateFieldActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_dateFieldActionPerformed

    private void idEmployeeTFKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_idEmployeeTFKeyPressed
        // TODO add your handling code here:
    }//GEN-LAST:event_idEmployeeTFKeyPressed

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
        } catch (ReflectiveOperationException | javax.swing.UnsupportedLookAndFeelException ex) {
            logger.log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(() -> new AttendancePanel().setVisible(true));
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JComboBox<String> attendanceStatusCombo;
    private javax.swing.JLabel attendanceLabel;
    private javax.swing.JTextField reasonField;
    private javax.swing.JButton exitBT;
    private javax.swing.JTextField employeeIdField;
    private javax.swing.JColorChooser jColorChooser1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel6;
    private javax.swing.JPanel jPanel7;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JLabel lb;
    private javax.swing.JTextField nameField;
    private javax.swing.JButton submitAttendanceButton;
    private javax.swing.JTable attendanceTable;
    private javax.swing.JTextField dateField;
    // End of variables declaration//GEN-END:variables
}
