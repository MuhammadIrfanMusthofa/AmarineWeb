import React from "react";

import * as script from "../script";
import HeaderLogin from "../components/HeaderLogin";
import FooterLogin from "../components/FooterLogin";

function daftar() {
  return (
    <div>
      {/* Header */}
      <HeaderLogin />
      {/* Header End */}

      {/* Main Content */}
      <div className="main-content">
        <div className="wrapper-main-content-login">
          <section className="section-gambar-login">
            <img src="assets/image-daftar.png" alt="" />
          </section>
          <section className="section-login">
            <header>Daftar</header>
            <form
              action="beranda"
              onSubmit={(event) => script.tampilkanPopupBerhasilLogin(event)}
            >
              <input
                type="email"
                name=""
                id=""
                placeholder="Masukkan email"
                required
                onInvalid={(e) =>
                  e.target.setCustomValidity("Tolong masukkan Email!")
                }
                onInput={(e) => e.target.setCustomValidity("")}
              />
              <input
                type="text"
                name=""
                id=""
                placeholder="Masukkan nama lengkap"
                required
                onInvalid={(e) =>
                  e.target.setCustomValidity("Tolong masukkan Nama Lengkap!")
                }
                onInput={(e) => e.target.setCustomValidity("")}
              />
              <input
                type="text"
                name=""
                id=""
                placeholder="Masukkan no telepon"
                required
                onInvalid={(e) =>
                  e.target.setCustomValidity("Tolong masukkan No Telepon!")
                }
                onInput={(e) => e.target.setCustomValidity("")}
              />
              <div className="password-input">
                <input
                  type="password"
                  name=""
                  id="password"
                  placeholder="Buat kata sandi"
                  required
                  onInvalid={(e) =>
                    e.target.setCustomValidity("Tolong masukkan Kata Sandi!")
                  }
                  onInput={(e) => e.target.setCustomValidity("")}
                />
                <img
                  src="assets/open-eye.svg"
                  alt=""
                  id="open-eye-password"
                  className="open-eye d-none"
                  onClick={() => script.togglePassword("password")}
                />
                <img
                  src="assets/close-eye.svg"
                  alt=""
                  id="close-eye-password"
                  className="close-eye"
                  onClick={() => script.togglePassword("password")}
                />
              </div>
              <div className="ingat-lupa-kata-sandi">
                <input
                  type="button"
                  value=""
                  name="s&k"
                  id="ingat-btn"
                  onClick={() => script.toggleIngat()}
                />
                <label for="s&k">
                  Saya menerima syarat dan ketentuan yang berlaku
                </label>
              </div>
              <input type="submit" value="Buat Akun" />
            </form>
            <div className="divider">atau</div>
            <div className="media-sosial-login">
              <a href="daftar">
                <img src="assets/facebook.svg" alt="Facebook" />
              </a>
              <a href="daftar">
                <img src="assets/apple.svg" alt="Apple" />
              </a>
              <a href="daftar">
                <img src="assets/google.svg" alt="Google" />
              </a>
            </div>
            <div className="sudah-memiliki-akun">
              <span>Sudah memiliki akun?</span> <a href="login">Masuk</a>
            </div>
          </section>
        </div>
      </div>
      {/* Main Content End */}

      {/* Popup */}
      <div id="popup-berhasil-simpan" className="popup-hidden-hapus">
        <div className="popup-box">
          <div className="popup-mini-icon"></div>
          <div className="popup-mini-icon"></div>
          <div className="popup-mini-icon"></div>
          <div className="popup-mini-icon"></div>
          <div className="popup-icon">
            <img src="assets/accept.svg" alt="Berhasil" />
          </div>
          <p className="popup-message">Berhasil!</p>
          <p className="popup-message popup-message-child popup-message-berhasil-daftar">
            Buat akun berhasil, kamu akan diarahkan ke layar masuk sekarang
          </p>
        </div>
      </div>
      {/* Popup End */}

      {/* Footer */}
      <FooterLogin />
      {/* Footer End */}
    </div>
  );
}

export default daftar;
