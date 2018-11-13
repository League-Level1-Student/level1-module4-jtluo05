/*
 *    Copyright (c) The League of Amazing Programmers 2013-2018
 *    Level 1
 */

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.net.URL;

import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingUtilities;

import javazoom.jl.player.advanced.AdvancedPlayer;

/* 1. Download the JavaZoom jar from here: http://bit.ly/javazoom
 * 2. Right click your project and add it as an External JAR (Under Java Build Path > Libraries).*/

public class Jukebox implements Runnable, ActionListener {
	JFrame frame = new JFrame();
	JButton button1 = new JButton();
	JPanel panel = new JPanel();
	JLabel label1 = new JLabel();
	JButton button2 = new JButton();
	JLabel label2 = new JLabel();
	JButton button3 = new JButton();
	JLabel label3 = new JLabel();
	Song song=new Song("mario.mp3");
	
	public static void main(String[] args) {
		SwingUtilities.invokeLater(new Jukebox());
	}

	public void run() {

		// 3. Find an mp3 on your computer or on the Internet.
		// 4. Create a Song

		// 5. Play the Song
	
		/*
		 * 6. Create a user interface for your Jukebox so that the user can to choose
		 * which song to play. You can use can use a different button for each song, or
		 * a picture of the album cover. When the button or album cover is clicked, stop
		 * the currently playing song, and play the one that was selected.
		 */
		frame.setDefaultCloseOperation(frame.EXIT_ON_CLOSE);
		frame.setVisible(true);
		label1=loadImage("happybirthday.jpg");
		button1.setText("Happy Birthday");
		button1.addActionListener(this);
		
		label2=loadImage("mariophoto.png");
		button2.setText("Super Mario Bros Theme Song");
		button2.addActionListener(this);
		label3=loadImage("jawsphoto.jpg");
		button3.setText("Jaws Theme Song");
		button3.addActionListener(this);
		panel.add(button1);
		panel.add(button2);
		panel.add(button3);
		panel.add(label1);
		panel.add(label2);
		panel.add(label3);
		frame.add(panel);
		frame.pack();
	}

	/* Use this method to add album covers to your Panel. */
	private JLabel loadImage(String fileName) {
		URL imageURL = getClass().getResource(fileName);
		Icon icon = new ImageIcon(imageURL);
		return new JLabel(icon);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
	if (e.getSource()==button1) {
		song.stop();
		 song = new Song("happybirthdaysong.mp3");
		song.play();
	}
	else if (e.getSource()==button2) {
		song.stop();
		 song = new Song("mario.mp3");
		song.play();
}
	else  if (e.getSource()==button3) {
		song.stop();
		 song = new Song("jaws.mp3");
		song.play();
}
	else {
	System.out.println("NOT WORKING!!!");	
	}
	}
	
	}



class Song {

	private int duration;
	private String songAddress;
	private AdvancedPlayer mp3Player;
	private InputStream songStream;

	/*
	 ** Songs can be constructed from files on your computer or Internet addresses.
	 ****
	 ***** Examples: <code> new Song("everywhere.mp3"); //from default package new
	 * Song("/Users/joonspoon/music/Vampire Weekend - Modern Vampires of the City/03 Step.mp3"
	 * ); new Song("http://freedownloads.last.fm/download/569264057/Get%2BGot.mp3");
	 ********* </code>
	 **********/
	public Song(String songAddress) {
		this.songAddress = songAddress;
	}

	public Song() {
		// TODO Auto-generated constructor stub
	}

	public void play() {
		loadFile();
		if (songStream != null) {
			loadPlayer();
			startSong();
		} else
			System.err.println("Unable to load file: " + songAddress);
	}

	public void setDuration(int seconds) {
		this.duration = seconds * 100;
	}

	public void stop() {
		if (mp3Player != null)
			mp3Player.close();
	}

	private void startSong() {
		Thread t = new Thread() {
			public void run() {
				try {
					if (duration > 0)
						mp3Player.play(duration);
					else
						mp3Player.play();
				} catch (Exception e) {
				}
			}
		};
		t.start();
	}

	private void loadPlayer() {
		try {
			this.mp3Player = new AdvancedPlayer(songStream);
		} catch (Exception e) {
		}
	}

	private void loadFile() {
		if (songAddress.contains("http"))
			this.songStream = loadStreamFromInternet();
		else
			this.songStream = loadStreamFromComputer();
	}

	private InputStream loadStreamFromInternet() {
		try {
			return new URL(songAddress).openStream();
		} catch (Exception e) {
			return null;
		}
	}

	private InputStream loadStreamFromComputer() {
		try {
			return new FileInputStream(songAddress);
		} catch (FileNotFoundException e) {
			return this.getClass().getResourceAsStream(songAddress);
		}
	}
}
