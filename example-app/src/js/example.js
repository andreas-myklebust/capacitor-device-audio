import { CapacitorDeviceAudio } from 'capacitor-device-audio';

window.testEcho = () => {
    const inputValue = document.getElementById("echoInput").value;
    CapacitorDeviceAudio.echo({ value: inputValue })
}
