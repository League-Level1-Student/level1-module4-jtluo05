/*
 *    Copyright (c) The League of Amazing Programmers 2013-2018
 *    Level 1
 */


import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Point;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingUtilities;

public class MagicBox extends JPanel implements Runnable, MouseListener {
JFrame frame=new JFrame();
JPanel panel=new JPanel();
JLabel label= new JLabel();
MediaPalace mp=new MediaPalace();
	/*
	 * We are going to hide secrets within the magic box. 
	 * When the user clicks on a secret place, stuff will happen.
	 *
	 * 1. Make the frame respond to mouse clicks.
	 * 
	 * 2. When the mouse is clicked, use the Media Palace (read the code in the default package) to play sounds, show images or speak.
	 * 
	 * 3. backgroundImage.getRGB(keyEvent.getX(), keyEvent.getY()) will give you the color of the current pixel.
	 */

	BufferedImage backgroundImage;

	public static void main(String[] args) throws Exception {
		SwingUtilities.invokeLater(new MagicBox());
		
	}

	@Override
	public void run() {
		try {
			loadBackgroundImage();
			createUI();
		} catch (Exception w) {
			System.err.println(w.getMessage());
		}
	}

	private void createUI() {
		JFrame frame = new JFrame("The Magic Box contains many secrets...");
		frame.add(this);
		setPreferredSize(new Dimension(backgroundImage.getWidth(), backgroundImage.getHeight()));
		frame.pack();
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setVisible(true);
		frame.addMouseListener(this);
		frame.add(panel);
	}

	private void loadBackgroundImage() throws Exception {
		String imageFile = "src/magic-box.jpg";
		try {
			backgroundImage = ImageIO.read(new File(imageFile));
		} catch (IOException e) {
			throw new Exception("Could not load image: " + imageFile);
		}
	}

	@Override
	public void paintComponent(Graphics g) {
		g.drawImage(backgroundImage, 0, 0, null);
		
	}

	@Override
	public void mouseClicked(MouseEvent e) {
		// TODO Auto-generated method stub
		

	Point point;
	point=	e.getLocationOnScreen();
	System.out.println(point);
	if(point.x>168&&point.x<191&&point.y>866&&point.y<882){
	 mp.playMusicOnComputer("/Users/League/Desktop/level1-module4-jtluo05/src/mario.mp3"); 
	
	System.out.println(" sound(mario) CLICK!");
	
	}
	
	if(point.x>238 && point.x<553 && point.y>262 && point.y<576){
		JFrame frame=new JFrame();
		JLabel label=new JLabel();
		label=mp.loadImageFromWithinProject("Mancity.jpg");
		frame.add(label);
		frame.setVisible(true);
		frame.pack();
		
		
		System.out.println(" picture CLICK!");
		
		}
	
	if(point.x<339&&point.x>184&&point.y<339&&point.y>174){
mp.speak("Why hello there! Ya got me!");
		
		System.out.println(" speak CLICK!");
		
		}
	
	if(point.x>87&&point.x<796&&point.y>109&&point.y<814){
		 mp.playMusicOnComputer("/Users/League/Desktop/level1-module4-jtluo05/src/snort.mp3"); 
		
		System.out.println(" sound(snort) CLICK!");
		
		}
	}
	@Override
	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

}


