/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package features;

/**
 *
 * Original project contributors
 */
import java.awt.Color;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.geom.Path2D;
import javax.swing.JPanel;

public class RoundedBottomPanel extends JPanel {


    private int cornerRadius = 25;

    public RoundedBottomPanel() {


        setOpaque(false);
    }
    

    public void setCornerRadius(int radius) {
        this.cornerRadius = radius;
        repaint();
    }

    @Override
    protected void paintComponent(Graphics g) {

        Graphics2D g2d = (Graphics2D) g.create();
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

        int w = getWidth();
        int h = getHeight();


        Path2D.Double path = new Path2D.Double();
        

        path.moveTo(0, 0);
        // 2. Garis lurus ke kanan atas (sudut tajam)
        path.lineTo(w, 0);

        path.lineTo(w, h - cornerRadius);
        // 4. Lengkungan kanan bawah
        path.quadTo(w, h, w - cornerRadius, h);

        path.lineTo(cornerRadius, h);
        // 6. Lengkungan kiri bawah
        path.quadTo(0, h, 0, h - cornerRadius);

        path.closePath();



        g2d.setColor(getBackground());
        

        g2d.fill(path);


        g2d.dispose();
        



        super.paintComponent(g);
    }
}
