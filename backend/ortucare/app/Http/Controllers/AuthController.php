<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Exception;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'username'   => 'required|string|unique:users',
            'email'      => 'required|email|unique:users',
            'password'   => 'required|string|min:8',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => $validator->errors(),
            ]);
        }

        try {
            $user = User::create([
                'username'   => $request->username,
                'email'      => $request->email,
                'password'   => Hash::make($request->password),
            ]);

            return response()->json([
                'status' => true,
                'message' => 'User berhasil didaftarkan.',
                'data' => $user,
            ]);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => 'Terjadi kesalahan saat register. ' . $e->getMessage(),
            ]);
        }
    }

    public function login(Request $request)
{
    $validator = Validator::make($request->all(), [
        'email' => 'required|string', 
        'password' => 'required|string',
    ]);

    if ($validator->fails()) {
        return response()->json([
            'status' => false,
            'message' => $validator->errors(),
        ]);
    }

    $credentials = $request->only('email', 'password');
    $token = Auth::guard('api')->attempt($credentials);

    if (!$token) {
        return response()->json([
            'status' => false,
            'message' => 'Unauthorized',
        ], 401);
    }

    $user = Auth::guard('api')->user();

    return response()->json([
        'status' => true,
        'message' => 'Sukses login',
        'data' => $user,
        'authorisation' => [
            'token' => $token,
            'type' => 'bearer',
        ],
    ]);
}

    public function logout()
    {
        Auth::guard('api')->logout();

        return response()->json([
            'status' => true,
            'message' => 'Berhasil logout.',
        ]);
    }

    public function getUser()
    {
        try {
            $users = User::all();
            return response()->json([
                'status' => true,
                'message' => 'Berhasil load semua user.',
                'data' => $users,
            ]);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => 'Gagal load data user. ' . $e->getMessage(),
            ]);
        }
    }

    public function getDetailUser($id)
    {
        try {
            $user = User::findOrFail($id);
            return response()->json([
                'status' => true,
                'message' => 'Berhasil load detail user.',
                'data' => $user,
            ]);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => 'Gagal load detail user. ' . $e->getMessage(),
            ]);
        }
    }

    public function update_user($id, Request $request)
    {
        $validator = Validator::make($request->all(), [
            'username'   => ['required', Rule::unique('users')->ignore($id)],
            'email'      => ['required', 'email', Rule::unique('users')->ignore($id)],
            'password'   => 'required|string|min:6',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => $validator->errors(),
            ]);
        }

        try {
            $user = User::findOrFail($id);
            $user->update([
                'username'   => $request->username,
                'email'      => $request->email,
                'password'   => Hash::make($request->password),
            ]);

            return response()->json([
                'status' => true,
                'message' => 'User berhasil diupdate.',
                'data' => $user,
            ]);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => 'Gagal update user. ' . $e->getMessage(),
            ]);
        }
    }

    public function hapus_user($id)
    {
        try {
            User::destroy($id);
            return response()->json([
                'status' => true,
                'message' => 'User berhasil dihapus.',
            ]);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => 'Gagal hapus user. ' . $e->getMessage(),
            ]);
        }
    }


public function forgotPassword(Request $request)
{
    $validator = Validator::make($request->all(), [
        'email' => 'required|email|exists:users,email',
        'new_password' => 'required|string|min:8|confirmed', // pakai konfirmasi
    ]);

    if ($validator->fails()) {
        return response()->json([
            'status' => false,
            'message' => $validator->errors(),
        ]);
    }

    try {
        $user = User::where('email', $request->email)->first();
        $user->password = Hash::make($request->new_password);
        $user->save();

        return response()->json([
            'status' => true,
            'message' => 'Password berhasil diubah.',
        ]);
    } catch (Exception $e) {
        return response()->json([
            'status' => false,
            'message' => 'Terjadi kesalahan. ' . $e->getMessage(),
        ]);
    }
}
}
