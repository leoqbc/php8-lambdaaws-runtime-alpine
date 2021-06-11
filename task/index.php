<?php
declare(strict_types=1);

function index(array $event): string
{
    return APIResponse('Hello World', 200);
}

function APIResponse(string $body, int $status): string
{
    $headers = [
        'Content-Type' => 'application/json',
        'Access-Control-Allow-Origin' => '*',
        'Access-Control-Allow-Headers' => 'Content-Type',
        'Access-Control-Allow-Methods' => 'OPTIONS,POST,GET'
    ];

    // Padrão de saída
    return json_encode([
        'statusCode' => $status,
        'headers' => $headers,
        'body' => $body
    ]);
}