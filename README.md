# CTTD
# code for paper:《Information Retrieval With Chessboard-Shaped Topology for Hyperspectral Target Detection》
DOI: 10.1109/TGRS.2023.3284653
# Abstract
Given a priori knowledge, hyperspectral target detection aims to locate objects of interest within specific scenes by utilizing differences in spectral characteristics among various land covers. However, for those traditional model-driven detectors with monotonic analytical mode, they perform mediocrely in the disassembly of hyperspectral image (HSI) data, failing to cope with real scenes with complexity. The discrepancy between fixed model assumptions and HSI data severely reduces detection effects, leading to the inability of such methods to mine deep-level features and adapt to the variability of imaging scenes. To overcome the limitations of traditional methods, we propose a chessboard-shaped topological framework for high-dimensional data structures to disassemble an HSI from both spatial and spectral dimensions adaptively. With hyperspectral target detection is refined into an information retrieval task in a topological space, a target detection method based on chessboard-shaped topology (CTTD) is proposed. In the topological space, latent and hidden data features of original images are presented in an intuitive way. Therefore, the differences in both spatial and spectral dimensions between the two classes of objects, namely target and background, are specifically amplified and exploited to perform the information retrieval task with superior performance. Extensive experimental results on benchmark HSI data sets demonstrate that CTTD can efficiently adapt to the variability of real scenes while extracting abundant and detailed information for accurate target localization. Moreover, both detection effects and computational efficiency exhibited by the proposed method provide a strong support for its popularization in practical applications.
# Index Terms
Hyperspectral image, target detection, information retrieval, topology, machine learning.
# Flowchart
![图片1](https://github.com/sxt1996/CTTD/assets/55687887/2782d756-4316-4691-96b7-9fb0292f683e)
# Data Set
AVIRIS-1: The AVIRIS-1 data set was acquired with the Airborne Visible/Infrared Imaging Spectrometer (AVIRIS). There are 100×100 pixels of an area in San Diego being collected. The spatial resolution is 3.5 m. And the spectrum spans a wavelength range of 370-2510nm, from which 224 spectral channels are collected. After removing the absorbing and low signal-to-noise ratio (SNR) portions, 189 bands are retained. The objects of interest are three airplanes in three positions, occupying 20, 22, and 22 pixels respectively.
# Guidelines
1. Install R2014a or higher versions of MATLAB
2. Download this code package
3. Set path
4. Don't worry about importing data or anything else, just run Main.m
# Contact
If you have any questions, please feel free to contact me.
sxt1996@outlook.com
