package com.example.ky_demo;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.image.ImageView;
import javafx.stage.Stage;
import javafx.scene.Parent;
import javafx.scene.Node;
import org.w3c.dom.events.MouseEvent;

import java.io.IOException;

public class HelloController {

    private Stage stage;
    private Scene scene;
    private Parent root;

    @FXML
    private Label welcomeText;

    @FXML
    private ImageView preview;


    @FXML
    public ImageView getPreview(){
        return preview;
    }

    @FXML
    protected void onHelloButtonClick() {
        welcomeText.setText("Welcome to JavaFX Application!");
    }


    @FXML
    void showNextScreen(ActionEvent event) throws IOException {
        root = FXMLLoader.load(getClass().getResource("emotionAssessment.fxml"));
        stage = (Stage)((Node)event.getSource()).getScene().getWindow();
        scene = new Scene(root);
        stage.setScene(scene);
        stage.show();
    }

    @FXML
    void one(ActionEvent event) throws IOException {
        root = FXMLLoader.load(getClass().getResource("emotionAssessment2.fxml"));
        stage = (Stage)((Node)event.getSource()).getScene().getWindow();
        scene = new Scene(root);
        stage.setScene(scene);
        stage.show();
    }

    @FXML
    void two(ActionEvent event) throws IOException {
        root = FXMLLoader.load(getClass().getResource("emotionAssessment2.fxml"));
        stage = (Stage)((Node)event.getSource()).getScene().getWindow();
        scene = new Scene(root);
        stage.setScene(scene);
        stage.show();
    }

    @FXML
    void three(ActionEvent event) throws IOException {
        root = FXMLLoader.load(getClass().getResource("emotionAssessment2.fxml"));
        stage = (Stage)((Node)event.getSource()).getScene().getWindow();
        scene = new Scene(root);
        stage.setScene(scene);
        stage.show();
    }

    @FXML
    void four(ActionEvent event) throws IOException {
        root = FXMLLoader.load(getClass().getResource("emotionAssessment2.fxml"));
        stage = (Stage)((Node)event.getSource()).getScene().getWindow();
        scene = new Scene(root);
        stage.setScene(scene);
        stage.show();
    }

    @FXML
    void five(ActionEvent event) throws IOException {
        root = FXMLLoader.load(getClass().getResource("emotionAssessment2.fxml"));
        stage = (Stage)((Node)event.getSource()).getScene().getWindow();
        scene = new Scene(root);
        stage.setScene(scene);
        stage.show();
    }

    @FXML
    void six(ActionEvent event) throws IOException {
        root = FXMLLoader.load(getClass().getResource("emotionAssessment2.fxml"));
        stage = (Stage)((Node)event.getSource()).getScene().getWindow();
        scene = new Scene(root);
        stage.setScene(scene);
        stage.show();
    }

    @FXML
    void seven(ActionEvent event) throws IOException {
        root = FXMLLoader.load(getClass().getResource("emotionAssessment2.fxml"));
        stage = (Stage)((Node)event.getSource()).getScene().getWindow();
        scene = new Scene(root);
        stage.setScene(scene);
        stage.show();
    }
    @FXML
    void eight(ActionEvent event) throws IOException {
        root = FXMLLoader.load(getClass().getResource("emotionAssessment2.fxml"));
        stage = (Stage)((Node)event.getSource()).getScene().getWindow();
        scene = new Scene(root);
        stage.setScene(scene);
        stage.show();
    }
    @FXML
    void nine(ActionEvent event) throws IOException {
        root = FXMLLoader.load(getClass().getResource("emotionAssessment2.fxml"));
        stage = (Stage)((Node)event.getSource()).getScene().getWindow();
        scene = new Scene(root);
        stage.setScene(scene);
        stage.show();
    }



}