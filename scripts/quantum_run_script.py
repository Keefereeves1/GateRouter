import pennylane as qml
import numpy as np

def quantum_operation():
    # Create a quantum device with 4 qubits
    dev = qml.device('default.qubit', wires=4)

    @qml.qnode(dev)
    def circuit():
        # Apply a Hadamard gate to each qubit to create a superposition
        for i in range(4):
            qml.Hadamard(wires=i)
        # Return the expectation values of the PauliZ measurements
        return [qml.expval(qml.PauliZ(i)) for i in range(4)]

    # Run the circuit and get the result
    result = circuit()

    # Convert the measurement results to a binary string
    binary_string = ''.join('1' if bit > 0 else '0' for bit in result)
    return binary_string.zfill(16)  # Ensure it is 16 bits long

if __name__ == "__main__":
    operation_result = quantum_operation()
    print(f"Quantum operation result: {operation_result}")

