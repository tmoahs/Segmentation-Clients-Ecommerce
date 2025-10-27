# Projet 5 : Segmentez des clients d'un site e-commerce

### Objectif & Résultats Principaux

Analyse exploratoire (SQL) et segmentation de la base clients pour définir des actions marketing ciblées. Un modèle de clustering (K-Means) a été développé sur la base d'une analyse RFM (Récence, Fréquence, Montant) et d'une ACP. L'analyse a permis d'identifier des profils distincts (ex: 3 segments pour nouveaux clients, 5 pour fidèles). Une **analyse de stabilité (score ARI)** a validé la pertinence des segments sur 6 mois, guidant la fréquence de réentraînement.

---

Ce cinquième projet du parcours Data Scientist d'OpenClassrooms aborde une nouvelle branche du Machine Learning : **l'apprentissage non supervisé**. La mission consiste à analyser les comportements des clients d'un site e-commerce afin de les regrouper en segments homogènes, une tâche essentielle pour la personnalisation marketing.

### Contexte

La segmentation client est une application très courante du Machine Learning en entreprise. Elle permet de mieux comprendre les comportements des clients et d'identifier des groupes partageant des caractéristiques communes, même en l'absence de données étiquetées. Ce projet introduit également l'utilisation de **SQL** pour l'analyse exploratoire, une compétence cruciale pour interroger des bases de données volumineuses.

### Missions

* Mener une **analyse exploratoire des données** directement en **SQL** pour interroger la base de données clients.
* Appliquer des **algorithmes de clustering** (ex: K-Means) pour regrouper les clients en différents segments.
* **Évaluer la performance** et la pertinence des clusters créés.
* **Analyser les segments** pour en déduire des profils clients et proposer des actions marketing ciblées.
* Réfléchir à la **maintenance** et à la mise à jour du modèle de segmentation une fois construit.

### Compétences Développées

* **Machine Learning Non Supervisé :** Application d'algorithmes de clustering pour la segmentation client.
* **SQL pour l'Analyse de Données :** Interrogation d'une base de données pour l'exploration de grands volumes de données.
* **Évaluation de Modèles :** Analyse de la performance et de la pertinence des modèles de clustering.
* **Analyse Business :** Transformation d'une analyse technique en recommandations stratégiques et actionnables pour le marketing.

### Outils et Librairies

* **Langages :** Python, SQL
* **Librairies :** Scikit-learn, Pandas, NumPy, Matplotlib, Seaborn
* **Outil :** Jupyter Notebook
