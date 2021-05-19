package io.github.fredgrott.background_trick

import android.os.Build
import android.view.WindowManager
import androidx.core.view.WindowCompat
import io.flutter.embedding.android.FlutterActivity


class MainActivity: FlutterActivity() {
    override fun onPostResume() {
        super.onPostResume()

        // to handle case of the bottom sys navbar
        if(Build.VERSION.SDK_INT>= Build.VERSION_CODES.O_MR1){
            window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS)
            window.addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION)
        }

        // fixes edge to edge on 30 and beyond only
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            WindowCompat.setDecorFitsSystemWindows(window, false)
            window.navigationBarColor = 0

        }

    }

}
