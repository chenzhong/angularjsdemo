<?php

header('Content-Type: application/json');

if(stripos($_SERVER["HTTP_ACCEPT"], "application/json") === 0) {
	$_POST = json_decode(file_get_contents("php://input"), true);
}

switch($_GET['action']) {
    case 'get':
        echo json_encode(array(
            array(
                'text' => 'First todo',
                'done' => false
            ),
            array(
                'text' => 'Second todo',
                'done' => false
            )
        ));
        break;

    case 'save':
        echo json_encode($_POST);
        break;

    case 'delete':
        echo json_encode($_POST);
        break;

    case 'done':
        echo json_encode($_POST);
        break;
}
