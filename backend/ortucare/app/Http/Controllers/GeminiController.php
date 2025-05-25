<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class GeminiController extends Controller
{
    public function asKAI(Request $request)
{
    $userPrompt = $request->input('prompt');

    // Tambahkan system prompt
    $systemPrompt = "You are Anam, a friendly and knowledgeable virtual assistant specialized in parenting. "
                  . "You give personal, fast, and relevant advice to mothers about child behavior, parenting problems, emotional support, and more. "
                  . "Always respond with warmth and empathy. Avoid generic replies. Be concise and supportive.";

    $fullPrompt = $systemPrompt . "\n\nUser: " . $userPrompt;

    $response = Http::withHeaders([
        'Content-Type' => 'application/json',
    ])->post("https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=" . env('GEMINI_API_KEY'), [
        'contents' => [
            [
                'parts' => [
                    ['text' => $fullPrompt]
                ]
            ]
        ]
    ]);

    $data = $response->json();

    // Ambil jawaban dari Gemini
    $answer = $data['candidates'][0]['content']['parts'][0]['text'] ?? null;

    if (!$answer) {
        return response()->json([
            'status' => false,
            'message' => 'Jawaban dari Gemini kosong atau tidak bisa diambil',
            'data' => $data
        ]);
    }

    return response()->json([
        'status' => true,
        'message' => 'Berhasil',
        'data' => $answer
    ]);
}
}
